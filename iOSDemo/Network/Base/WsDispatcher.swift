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
    let socket: WebSocket
    var requestCounter: Int = 0;
    var callMap: [Int:((String?) -> Void)] = [:]
    var queue: [(messageId:Int, message:String, messageCallback:((String?) -> Void)?)] = []

    init() {
        socket = WebSocket(url: NSURL(string: WsDispatcher.apiURL)!, protocols: ["chat", "superchat"])
        socket.delegate = self
    }

    func start() {
        startMonitoringReachability()
        connectWs()
    }

    // Socket

    func connectWs() {
        socket.connect()
    }

    func disconnectWs() {
        socket.disconnect()
    }

    func websocketDidConnect(socket: WebSocket) {
        EventBus.publish(WsConnectivityChangedEvent(true))

        // If user is "logged in" attempt to create session
        if (SessionManager.instance.loggedIn) {
            if let credentials = SessionManager.instance.getLastLoggedInCredentials() {
                let wsReq = WsLogin.Request()
                wsReq.email = credentials.user.entity?.email
                wsReq.password = credentials.password
                WsDispatcher.instance.send(wsReq) {
                    (wsResp: WsLogin.Response?) in
                    guard let response = wsResp, let user = wsResp?.user where response.code == .SUCCESS else {
                        SessionManager.instance.logout()
                        return
                    }
                    setupForUser(user, password, onCompletion)
                }
            }else {
                SessionManager.instance.logout()
            }
        }
    }

    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        EventBus.publish(WsConnectivityChangedEvent(false))
        connectWs()
    }

    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        guard let wsMessage = WsMessage.decode(text) else {
            print("Unable to decode WsMessage: " + text)
            return
        }

        guard let messageId = wsMessage.header?.id else {
            print("WsMessage has no id: " + text)
            return
        }

        callMap[messageId]?(wsMessage.body)
        callMap.removeValueForKey(messageId)
    }

    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
    }

    func isWsConnected() -> Bool {
        return socket.isConnected
    }

    func send<REQ, RESP where REQ: WsRequest, REQ.Response == RESP, RESP: JSONSerializable>(request: REQ, onResponse: ((RESP?) -> Void)?) {
        let messageId = getNextRequestId()

        guard let message = getRequestMessage(request, messageId) else {
            print("Error, attempting to send nil message")
            return
        }

        let messageCallback = getMessageCallback(onResponse)

        if !REQ.isQueueable() {
            if isWsConnected() {
                sendMessage(message, messageId, messageCallback)
            } else {
                if let onResponse = onResponse {
                    onResponse(nil)
                }
            }
            return
        }

        if !isWsConnected() {
            queue.append((messageId: messageId, message: message, messageCallback: messageCallback))
            return
        }

        sendMessage(message, messageId, messageCallback)
    }

    private func getRequestMessage<REQ:WsRequest>(request: REQ, _ requestId: Int) -> String? {
        let header = WsHeader()
        header.method = WsMethod.IN.rawValue
        header.id = requestId
        header.type = REQ.getPath()
        return WsMessage(header: header, body: request.stringify()).encode()
    }

    private func getMessageCallback<RESP:JSONSerializable>(onResponse: ((RESP?) -> Void)?) -> ((String?) -> Void)? {
        guard let onResponse = onResponse else {
            return nil
        }

        return {
            (message: String?) in
            var response: RESP?
            if let message = message {
                if let json = message.toJSON() {
                    response = RESP(json: json)
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                onResponse(response)
            })
        }
    }

    private func sendMessage(message: String, _ messageId: Int, _ onResponse: ((String?) -> Void)?) {
        if let onResponse = onResponse {
            callMap[messageId] = onResponse
        }
        socket.writeString(message)
    }

    func emptyWsQueue(fireCallbacks: Bool = false) {
        if (fireCallbacks) {
            for q in queue {
                if let callback = q.messageCallback {
                    callback(nil)
                }
            }
        }
        queue.removeAll()
    }

    func flushWsQueue() {
        for q in queue {
            sendMessage(q.message, q.messageId, q.messageCallback)
        }
        queue.removeAll()
    }

    func onLoginSuccess(sameUser: Bool) {
        if (sameUser) {
            flushWsQueue()
        } else {
            emptyWsQueue(false)
        }
    }

    func getNextRequestId() -> Int {
        // Handle overflow.  This will probably never happen.
        // 2 billion requests... c'mon!
        if requestCounter < 1 {
            requestCounter = 0;
        }
        requestCounter = requestCounter + 1
        return requestCounter
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
