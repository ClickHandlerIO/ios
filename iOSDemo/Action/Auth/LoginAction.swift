//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

struct LoginAction: ActionProtocol {
    typealias Request = LoginAction.REQ
    typealias Response = LoginAction.RESP

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: Request, operation: NSOperation, onCompletion: ((Response) -> Void)) {
        if operation.cancelled {
            loginFailed(onCompletion, .CANCELLED)
            return
        }

        guard let username = request.username, password = request.password else {
            loginFailed(onCompletion, .FAILED)
            return
        }

        // If no WS Connection, attempt local login
        if !WsDispatcher.instance.isWsConnected() {
            if let credentials = SessionManager.instance.getLastLoggedInCredentials() {
                if credentials.user.entity?.email == username && credentials.password == password {
                    setupForUser(credentials.user, credentials.password, onCompletion)
                    return
                }
            }
        }

        // Check Web
        let wsReq = WsLoginManual.Request()
        wsReq.email = username
        wsReq.password = password
        WsDispatcher.instance.send(wsReq) {
            (wsResp: WsLoginManual.Response?) in
            guard let response = wsResp, let user = wsResp?.user where response.code == .SUCCESS else {
                loginFailed(onCompletion, .FAILED)
                return
            }
            setupForUser(user, password, onCompletion)
        }
    }

    static func loginFailed(callback: ((Response) -> Void), _ code: LoginAction.Response.Code) {
        DatabaseManager.instance.close()
        SessionManager.instance.logout()
        callback(Response(code))
    }

    static func setupForUser(user: User, _ password: String, _ callback: ((Response) -> Void)) {

        // open DB connection
        DatabaseManager.instance.open() {
            (success: Bool) in
            if !success {
                loginFailed(callback, .DB_CONNECTION)
                return
            }

            // Setup session. If same user as logged in previously flush WsQueue, else clear it
            let sameUser = SessionManager.instance.loginSuccessful(user, password)
            if sameUser {
                WsDispatcher.instance.flushWsQueue()
            }else {
                WsDispatcher.instance.emptyWsQueue()
            }
            callback(Response(.SUCCESS))
        }
    }

    struct REQ {
        var username: String?
        var password: String?
    }

    struct RESP {
        var code: Code

        init(_ code: Code) {
            self.code = code
        }

        enum Code {
            case SUCCESS
            case FAILED
            case DB_CONNECTION
            case CANCELLED
        }

    }

}