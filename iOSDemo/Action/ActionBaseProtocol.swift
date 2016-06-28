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

struct LoginAction: ActionProtocol {
    typealias Request = LoginAction.REQ
    typealias Response = LoginAction.RESP

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
            case CANCELLED
            case FAILED
            case SUCCESS
        }

    }

}

struct ListAction: ActionProtocol {
    typealias Request = ListAction.REQ
    typealias Response = ListAction.RESP

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: Request) -> Response {
        if let search = request.search {
            print("hello search")
            return Response(.SUCCESS, ["1", "2", "3"])
        }

        return Response(.FAILED, nil)
    }

    struct REQ {
        var search: String?
    }

    struct RESP {
        var code: Code
        var data: [String]?

        init(_ code: Code, _ data: [String]?) {
            self.code = code
            self.data = data
        }

        enum Code {
            case CANCELLED
            case FAILED
            case SUCCESS
        }
    }
}