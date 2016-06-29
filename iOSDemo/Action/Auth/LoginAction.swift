//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

/*
struct LoginAction: ActionProtocol {
    typealias Request = LoginAction.REQ
    typealias Response = LoginAction.RESP

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: Request, operation: NSOperation) -> Response {
        // todo guard against nil username and pw
        // todo mulitple unwrap and guard?

        if operation.cancelled {
            return Response(.FAILED)
        }

        if let username = request.username {
            print("hello")
            if let password = request.password {
                print("there")
                return Response(.SUCCESS)
            }
        }

        return Response(.FAILED)
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

}*/
