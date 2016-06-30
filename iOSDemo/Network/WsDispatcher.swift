//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import ReachabilitySwift
import Starscream

class WsDispatcher: WebSocketDelegate {
    static let instance = WsDispatcher()
    static let apiURL = "wss://devapi.movemedical.com/v1"

    var reachability: Reachability?
    let socket = WebSocket(url: NSURL(string: apiURL)!, protocols: ["chat", "superchat"])

    func start() {
        startMonitoringReachability()
        connectWs()
    }

    // Socket

    func connectWs() {
        socket.delegate = self;
        socket.connect()
    }

    func disconnectWs() {
        socket.disconnect()
    }

    func websocketDidConnect(socket: WebSocket) {
        EventBus.publish(WsConnectivityChangedEvent(true))

        if (SessionManager.instance.loggedIn) {
            // todo autologin if possible (look at session manager to see if currently logged in)

            // todo if login successfuly flush the queue
            // if login not successful set loggedIn to false (will fire event so the UI can handle accordingly
        }
    }

    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        EventBus.publish(WsConnectivityChangedEvent(false))
    }

    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        // todo handle recieving inbound
    }

    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
    }

    func isWsConnected() -> Bool {
        return socket.isConnected
    }

    func login(loginAction: AnyObject) {
        // pass this to the front of the queue
    }

    func send<REQ, RESP where REQ:WsRequest, REQ.Response == RESP>(request: REQ, onResponse: ((RESP) -> Void)?) {

        if !REQ.isQueueable() {
            if isWsConnected() {
                // todo send request now
            }else {
                // todo send failure now (null response?)
            }
            return
        }

        if !isWsConnected() {
            // todo add to queue
            return
        }

        // todo send now
    }

    func emptyWsQueue() {
        // todo remove all req in queue
    }

    func flushWsQueue() {
        // todo send all queued ws events
    }

    func onLoginSuccess(sameUser: Bool) {
        if (sameUser) {
            // todo flush the queue
        } else {
            emptyWsQueue()
        }
    }

    // Reachability

    func startMonitoringReachability() {
        do {
            reachability = try Reachability.reachabilityForInternetConnection() // try Reachability(hostname: WsDispatcher.apiURL) // todo use diff URL for server to see if API is reachable
        } catch {
            print("Could not create Reachability")
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onReachabilityChanged(_:)), name: ReachabilityChangedNotification, object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            print("Could not start reachability notifier")
        }
    }

    func stopMonitoringReachability() {
        reachability?.stopNotifier()
        NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: reachability)
    }

    @objc func onReachabilityChanged(n: NSNotification) {
        if let r = reachability {
            EventBus.publish(ReachabilityChangedEvent(reachable: r.isReachable(), reachableViaWifi: r.isReachableViaWiFi()))

            if r.isReachable() && !socket.isConnected {
                connectWs()
            }
        }
    }
}
