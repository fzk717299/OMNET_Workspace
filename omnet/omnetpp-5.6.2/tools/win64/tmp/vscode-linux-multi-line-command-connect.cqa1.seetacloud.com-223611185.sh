
echo "7139fd5b5028: running"

#
# Setup
#
VSC_TMP="${XDG_RUNTIME_DIR:-`echo /tmp`}"
COMMIT_ID="5b19bac7a947f54e4caa3eb7e4c5fbf832389850"
SERVER_APP_NAME="cursor-server"
TELEMETRY="--telemetry-level all"
export VSCODE_AGENT_FOLDER=$HOME/.cursor-server
ALLOW_CLIENT_DOWNLOAD="1"
FORCE_CLIENT_DOWNLOAD="0"

CLI_NAME_IN_ARCHIVE=cursor
CLI_NAME_ON_DISK="$CLI_NAME_IN_ARCHIVE-$COMMIT_ID"
CLI_PATH="$VSCODE_AGENT_FOLDER/$CLI_NAME_ON_DISK"
CLI_LOG_FILE="$VSCODE_AGENT_FOLDER/.cli.$COMMIT_ID.log"

now=`date +%s`

UNPACK_RESULT=
DID_LOCAL_DOWNLOAD=0
DOWNLOAD_TIME=
INSTALL_TIME=
SERVER_START_TIME=
CONNECTION_TOKEN=


fail_with_exitcode() {
	echo "7139fd5b5028: start"
	echo "exitCode==$1=="
	echo_common_results
	echo "7139fd5b5028: end"
	exit 0
}

echo_common_results() {
	echo "listeningOn==$LISTENING_ON=="
	echo "osReleaseId==$OSRELEASEID=="
	echo "arch==$ARCH=="
	echo "vscodeArch==$VSCODE_ARCH=="
	echo "bitness==$BITNESS=="
	echo "tmpDir==$VSC_TMP=="
	echo "platform==$PLATFORM=="
	echo "unpackResult==$UNPACK_RESULT=="
	echo "didLocalDownload==$DID_LOCAL_DOWNLOAD=="
	echo "downloadTime==$DOWNLOAD_TIME=="
	echo "installTime==$INSTALL_TIME=="
	echo "serverStartTime==$SERVER_START_TIME=="
	echo "execServerToken==e602f920-adea-4fbb-a288-7deeea7f2774=="
}

millis() {
	if [[ $PLATFORM == linux ]]; then
		echo $(($(date +%s%N)/1000000))
	else
		# Can't get actual millis on mac
		echo $(($(date +%s)*1000))
	fi
}

elapsed() {
	echo $(($(millis) - $1))
}

if [[ ! -d "$VSCODE_AGENT_FOLDER" ]]; then
	mkdir -p "$VSCODE_AGENT_FOLDER"

	if (( $? > 0 ))
	then
		echo "Creating the server install dir failed..."
		fail_with_exitcode 34
	fi
fi

printenv_indent() {
	echo "printenv:"
	printenv | sed 's/^/    /'
}

#
# Get OS name
#
OSRELEASEID=`cat /etc/os-release 2>/dev/null | grep -a -E '^ID=' | sed 's/^[Ii][Dd]=//g' | sed 's/"//g'`
if [[ -z $OSRELEASEID ]]
then
	OSRELEASEID=`cat /usr/lib/os-release 2>/dev/null | grep -a -E '^ID=' | sed 's/^[Ii][Dd]=//g' | sed 's/"//g'`
	if [[ -z $OSRELEASEID ]]
	then
		OSRELEASEID=`uname -s`
	fi
fi

#
# Get host platform/architecture
#
UNAME=$(uname -s)
case $UNAME in
	Linux) PLATFORM=linux;;
	Darwin) PLATFORM=macOS;;
	*)
		echo "Unsupported platform: $UNAME"
		fail_with_exitcode 35
		;;
esac

BITNESS=$(getconf LONG_BIT)
ARCH=$(uname -m)
case $ARCH in
	x86_64) VSCODE_ARCH="x64";;
	armv7l | armv8l)
		VSCODE_ARCH="armhf"
		;;
	arm64 | aarch64)
		if [[ $BITNESS == 32 ]]; then
			# Can have 32-bit userland on 64-bit kernel
			VSCODE_ARCH="armhf"
		else
			VSCODE_ARCH="arm64"
		fi
		;;
	*)
		OSRELEASE=$(uname -r)
		case $OSRELEASE in
			*x86_64*) VSCODE_ARCH="x64";;
			*)
				echo "Unsupported architecture: $ARCH"
				fail_with_exitcode 27
			;;
		esac
		;;
esac

if [[ $PLATFORM == linux ]]; then
	if [[ $VSCODE_ARCH == armhf ]]; then
		PLATFORM_DOWNLOAD_PATH=cli-linux-armhf
	else
		PLATFORM_DOWNLOAD_PATH=cli-alpine-$VSCODE_ARCH
	fi
elif [[ $VSCODE_ARCH == "arm64" ]]; then
	PLATFORM_DOWNLOAD_PATH=cli-darwin-arm64
else
	PLATFORM_DOWNLOAD_PATH=cli-darwin-x64
fi

#
# Delete old CLIs if needed
#
TO_DELETE=$(ls -1 -t "$VSCODE_AGENT_FOLDER" | grep -E "code(-insiders)?-[a-fA-F0-9]{40}" | tail -n +6)
for CLI_TO_DELETE in $TO_DELETE; do
	echo "Found old VS Code install $CLI_TO_DELETE, attempting to clean up"

	if (( $? == 0 )); then
		echo "Deleting old install $VSCODE_AGENT_FOLDER/$CLI_TO_DELETE"
		rm -rf "$VSCODE_AGENT_FOLDER/$CLI_TO_DELETE"
	fi
done

do_client_download() {
	DID_LOCAL_DOWNLOAD=1
	echo "Trigger local server download"
	echo 7139fd5b5028:trigger_server_download
	echo artifact==$PLATFORM_DOWNLOAD_PATH==
	echo destFolder==$VSCODE_AGENT_FOLDER==
	echo destFolder2==/vscode-cli-$COMMIT_ID.tar.gz==
	echo 7139fd5b5028:trigger_server_download_end
	echo "Waiting for client to transfer server archive..."
	echo "Waiting for $VSCODE_AGENT_FOLDER/vscode-cli-$COMMIT_ID.tar.gz.done and vscode-server.tar.gz to exist"

	while true; do
		if [[ -f "$VSCODE_AGENT_FOLDER/vscode-cli-$COMMIT_ID.tar.gz.done" ]]; then
			if [[ ! -f "$VSCODE_AGENT_FOLDER/vscode-cli-$COMMIT_ID.tar.gz" ]]; then
				echo "Found flag but not server tar - server transfer failed"
				fail_with_exitcode 31
			fi

			echo "Found flag and server on host"
			rm "$VSCODE_AGENT_FOLDER/vscode-cli-$COMMIT_ID.tar.gz.done"
			break
		else
			echo -n ' '
			sleep 3
		fi
	done
}

do_client_download_or_fail() {
	if [[ $DID_LOCAL_DOWNLOAD == "1" ]]; then
		echo "Already attempted local download, failing"
		fail_with_exitcode $1
	elif [[ $ALLOW_CLIENT_DOWNLOAD == "1" ]]; then
		do_client_download
		LOCAL_DOWNLOAD_RESULT=success
	else
		fail_with_exitcode $1
	fi
}

do_host_download() {
	start=$(millis)
	echo '7139fd5b5028%%1%%'

	DOWNLOAD_URL=https://cursor.blob.core.windows.net/remote-releases/$COMMIT_ID/$PLATFORM_DOWNLOAD_PATH.tar.gz

	wget --version &> /dev/null
	if (( $? == 0 ))
	then
		echo "Downloading with wget"
		WGET_ERRORS=$(2>&1 wget --no-config --tries=1 --connect-timeout=7 --dns-timeout=7 -nv -O vscode-cli-$COMMIT_ID.tar.gz $DOWNLOAD_URL)
		if (( $? != 0 ))
		then
			echo "wget download failed"
			echo $WGET_ERRORS
			printenv_indent

			do_client_download_or_fail 25
		else
			echo "Download complete"
			DOWNLOAD_TIME=$(elapsed $start)
		fi
	else
		curl --version &> /dev/null
		if (( $? == 0 ))
		then
			echo "Downloading with curl"
			CURL_OUTPUT=$(curl --disable --connect-timeout 7 -L $DOWNLOAD_URL --output vscode-cli-$COMMIT_ID.tar.gz -w "%{http_code}")
			if [[ ($? != 0) || ($CURL_OUTPUT != 2??) ]]
			then
				echo "curl download failed"
				echo $CURL_OUTPUT
				printenv_indent

				do_client_download_or_fail 25
			else
				echo "Download complete"
				DOWNLOAD_TIME=$(elapsed $start)
			fi
		else
			printenv_indent
			echo "Neither wget nor curl is installed"

			do_client_download_or_fail 26
		fi
	fi
}

do_install() {
	start=$(millis)
	echo '7139fd5b5028%%2%%'
	UNPACK_RESULT=success
	echo 'tar --version:'
	tar --version
	tar -xf vscode-cli-$COMMIT_ID.tar.gz
	TAR_EXIT=$?
	INSTALL_TIME=$(elapsed $start)

	if (( $TAR_EXIT > 0 ))
	then
		echo "ERROR: tar exited with non-0 exit code: $?"
		UNPACK_RESULT=error
		do_client_download_or_fail 37
		do_install
		return
	fi

	mv "$CLI_NAME_IN_ARCHIVE" "$CLI_PATH"

	# cheap sanity check
	eval "$CLI_PATH --version"
	if (( $? != 0 ))
	then
		UNPACK_RESULT=missingFiles
		echo "ERROR: $CLI_PATH don't exist"
		do_client_download_or_fail 37
		do_install
		return
	fi

	# Delete the leftover folder which might have -web prefix, and the .tar.gz
	rm -rf vscode-cli*
}

#
# Install if needed
#
if [[ ! -f "$CLI_PATH" ]]
then
	echo "Installing to $VSCODE_AGENT_FOLDER..."
	STASHED_WORKING_DIR="`pwd`"
	cd "$VSCODE_AGENT_FOLDER"

	if [[ $FORCE_CLIENT_DOWNLOAD == "1" ]]; then
		do_client_download
	else
		do_host_download
	fi

	do_install
	cd "$STASHED_WORKING_DIR"
else
	echo "Found existing installation at $VSCODE_AGENT_FOLDER..."
fi


#
# Start the server
#
start_server() {
	echo "Starting VS Code CLI... \"$CLI_PATH\" command-shell --cli-data-dir \"$VSCODE_AGENT_FOLDER/cli\" --on-port --on-host=127.0.0.1 --parent-process-id $$ &> \"$CLI_LOG_FILE\" < /dev/null"
	printenv_indent
	start=$(millis)
	if [[ -f $CLI_LOG_FILE ]]; then
		echo "Removing old logfile at $CLI_LOG_FILE"
		rm "$CLI_LOG_FILE" # See #6265
	fi
	VSCODE_CLI_REQUIRE_TOKEN=e602f920-adea-4fbb-a288-7deeea7f2774 "$CLI_PATH" command-shell --cli-data-dir "$VSCODE_AGENT_FOLDER/cli" --parent-process-id $$ --on-port --on-host=127.0.0.1 &> "$CLI_LOG_FILE" < /dev/null &
	CLI_PID=$!
	echo "Spawned remote CLI: $!"

	stopTime=$((SECONDS+15))

	while (($SECONDS < $stopTime))
	do
		LISTENING_ON=`cat "$CLI_LOG_FILE" | grep -a -E 'Listening on .+' | grep -v grep | sed 's/Listening on //'`
		if [[ $LISTENING_ON != '' ]]
		then
			break
		fi

		if ! ps -p $CLI_PID > /dev/null; then
			echo "Exec server process not found"
			cat $CLI_LOG_FILE
			break
		fi

		echo "Waiting for server log..."
		sleep .03
	done

	SERVER_START_TIME=$(elapsed $start)
}

start_server

# What we echo below cannot be wider than 80 characters
echo "7139fd5b5028: start"
echo SSH_AUTH_SOCK==$SSH_AUTH_SOCK==
echo DISPLAY==$DISPLAY==
echo_common_results
echo "7139fd5b5028: end"

while true; do sleep 180; echo -n ' '; done
