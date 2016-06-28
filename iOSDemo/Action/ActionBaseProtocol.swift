//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

protocol ActionProtocol {
    associatedtype Request
    associatedtype Response

    static func actionType() -> ActionType

    static func run(request: Request) -> Response
}

//struct AnyAction<REQ, RESP>: ActionProtocol {
//    typealias Request = REQ
//    typealias Response = RESP
//
//    let _actionType: () -> ActionType
//    let _run: (REQ) -> RESP
//
//    init<Base:ActionProtocol where Base.Request == REQ, Base.Response == RESP>(base: Base) {
//        _actionType = base.actionType
//        _run = base.run
//    }
//
//    func actionType() -> ActionType {
//        return _actionType()
//    }
//
//    func run(request: Request) -> Response {
//        return _run(request)
//    }
//}

struct LoginAction: ActionProtocol {
    typealias Request = LoginAction.Req
    typealias Response = LoginAction.Resp

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: Request) -> Response {
        // todo guard against nil username and pw
        // todo mulitple unwrap and guard?

        if let username = request.username {
            print("hello")
            if let password = request.password {
                print("there")
                return Response(.SUCCESS)
            }
        }

        return Response(.FAILURE)
    }

    struct Req {
        var username: String?
        var password: String?
    }

    struct Resp {
        var code: Code

        init(_ code: Code) {
            self.code = code
        }

        enum Code {
            case SUCCESS
            case FAILURE
        }

    }

}


/*
struct LoginAction: Action {
    typealias Request = LoginAction.Req
    typealias Response = LoginAction.Resp

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: Request) -> Response {
        // todo guard against nil username and pw
        // todo mulitple unwrap and guard?

        if let username = request.username {
            print("hello")
            if let password = request.password {
                print("there")
                return Response(.SUCCESS)
            }
        }

        return Response(.FAILURE)
    }

    struct Req {
        var username: String?
        var password: String?
    }

    struct Resp {
        var code: Code

        init(_ code: Code) {
            self.code = code
        }

        enum Code {
            case SUCCESS
            case FAILURE
        }
    }
}*/
