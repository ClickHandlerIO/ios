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
            onCompletion(Response(.CANCELLED))
            return
        }

        guard let username = request.username, password = request.password else {
            onCompletion(Response(.FAILED))
            return
        }

        var code = LoginAction.Response.Code.FAILED

        // check if local login
        // todo store the User with the credentials so we can instantiate session info from it
        if let credentials = SessionManager.instance.getLastLoggedInCredentials() {
            if credentials.user.entity?.email == username && credentials.password == password {
                code = .SUCCESS
            }
        }

        if code == .FAILED {

            // check web
            let wsReq = WsLogin.Request()
            wsReq.email = username
            wsReq.password = password
//            WsDispatcher.instance.send(wsReq) {
//                (wsResp: WsLogin.Response) in
//
//
//            }


        }

        guard code == .SUCCESS else {
            onCompletion(Response(code))
            return
        }

        // open DB connection / app setup

        // setup session manager

        // on completion of db setup call onCompletion()
    }

    func setupAppForUser(user: AnyObject, password: String) {

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
            case CANCELLED
        }

    }

}