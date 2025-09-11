#include "FollowRsuApp.h"
#include "inet/common/ModuleAccess.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/transportlayer/udp/Udp.h"
#include "veins_inet/VeinsInetMobility.h" // Import for VeinsInetMobility

Define_Module(FollowRsuApp);

FollowRsuApp::FollowRsuApp() {}

// --- Initialization ---
void FollowRsuApp::initialize(int stage)
{
    UdpBasicApp::initialize(stage);
    if (stage == inet::INITSTAGE_LOCAL) {
        // Get parameters
        leaderCarId_ = par("leaderCarId").stringValue();
        followerCarId_ = par("followerCarId").stringValue();
        serverDestAddrName_ = par("serverDestAddr").stringValue();
        serverDestPort_ = par("serverDestPort");
        checkInterval_ = par("checkInterval");

        // Initialize timer
        checkTimer_ = new cMessage("checkTimer");
        // Note: Server address resolution is deferred to runtime
    }
}

void FollowRsuApp::handleMessageWhenUp(cMessage *msg)
{
    if (msg == checkTimer_) {
        if (getTraCIInterface()) {
            checkCarsAndSendInfo();
        }
        scheduleAt(simTime() + checkInterval_, checkTimer_);
        return;
    }
    UdpBasicApp::handleMessageWhenUp(msg);
}

// --- Main Logic ---
void FollowRsuApp::checkCarsAndSendInfo()
{
    EV_INFO << "RSU: Checking vehicle states..." << endl;

    if (!manager_) {
        EV_ERROR << "RSU: TraCIScenarioManager not available." << endl;
        return;
    }

    try {
        const auto& managedHosts = manager_->getManagedHosts();
        auto leaderIt = managedHosts.find(leaderCarId_);
        auto followerIt = managedHosts.find(followerCarId_);

        if (leaderIt != managedHosts.end() && followerIt != managedHosts.end()) {
            cModule* leaderModule = leaderIt->second;
            cModule* followerModule = followerIt->second;

            auto* leaderMobility = check_and_cast<veins::VeinsInetMobility*>(leaderModule->getSubmodule("mobility"));
            auto* followerMobility = check_and_cast<veins::VeinsInetMobility*>(followerModule->getSubmodule("mobility"));

            if (leaderMobility && followerMobility) {
                inet::Coord leaderPos = leaderMobility->getCurrentPosition();
                inet::Coord followerPos = followerMobility->getCurrentPosition();
                double leaderSpeed = traci_->vehicle(leaderCarId_).getSpeed();

                double distance = leaderPos.distance(followerPos);

                EV_INFO << "RSU: Leader (" << leaderCarId_ << ") speed: " << leaderSpeed
                        << " m/s. Distance to follower (" << followerCarId_ << "): " << distance << " m." << endl;

                auto payload = makeShared<FollowPacket>();
                payload->setLeaderSpeed(leaderSpeed);
                payload->setDistance(distance);
                // Read payload length from parameter (fallback to 50B if unset)
                int lenBytes = par("messageLength");
                if (lenBytes <= 0) lenBytes = 50;
                payload->setChunkLength(B(lenBytes));

                Packet *packet = new Packet("FollowData");
                packet->insertAtBack(payload);

                // Dynamically resolve server address at runtime
                try {
                    L3Address serverAddr = L3AddressResolver().resolve(serverDestAddrName_.c_str());
                    socket.sendTo(packet, serverAddr, serverDestPort_);
                    EV_INFO << "RSU: Sent packet to server (" << serverDestAddrName_ << " -> " << serverAddr << ")" << endl;
                }
                catch (const std::exception& e) {
                    EV_ERROR << "RSU: Failed to resolve server address '" << serverDestAddrName_ << "': " << e.what() << endl;
                    delete packet;
                }
            }
        }
        else {
            EV_WARN << "RSU: Leader or follower vehicle not found in managed hosts. Skipping." << endl;
        }
    }
    catch (const std::exception& e) {
        EV_ERROR << "RSU: Error accessing vehicle data: " << e.what() << ". A vehicle might have left the simulation." << endl;
    }
}

// --- Helper and Overridden Methods ---
bool FollowRsuApp::getTraCIInterface()
{
    if (!traci_) {
        cModule* managerModule = getSimulation()->getModuleByPath("<root>.veinsManager");
        if (managerModule) {
            manager_ = dynamic_cast<veins::TraCIScenarioManager*>(managerModule);
            if (manager_) {
                traci_ = manager_->getCommandInterface();
            }
        }
        if (!traci_) {
            EV_ERROR << "RSU: TraCI interface not found." << endl;
            return false;
        }
    }
    return true;
}

void FollowRsuApp::processPacket(Packet *pk)
{
    // This app only sends data, does not process incoming packets.
    delete pk;
}

// --- Lifecycle ---
void FollowRsuApp::finish()
{
    if (checkTimer_ && checkTimer_->isScheduled()) {
        cancelEvent(checkTimer_);
    }
    delete checkTimer_;
    checkTimer_ = nullptr;
    UdpBasicApp::finish();
}

FollowRsuApp::~FollowRsuApp()
{
    cancelAndDelete(checkTimer_);
}

void FollowRsuApp::handleStartOperation(LifecycleOperation *operation)
{
    socket.setOutputGate(gate("socketOut"));
    int localPort = par("localPort");
    socket.bind(L3Address(), localPort);
    scheduleAt(simTime() + checkInterval_, checkTimer_);
}

void FollowRsuApp::handleStopOperation(LifecycleOperation *operation)
{
    if (checkTimer_ && checkTimer_->isScheduled()) {
        cancelEvent(checkTimer_);
    }
    socket.close();
}
