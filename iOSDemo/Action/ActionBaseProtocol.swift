//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

protocol ActionProtocol {
    associatedtype REQUEST
    associatedtype RESPONSE

    static func actionType() -> ActionType

    static func run(request: REQUEST) -> RESPONSE
}

struct LoginAction: ActionProtocol {
    typealias REQUEST = LoginAction.Request
    typealias RESPONSE = LoginAction.Response

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: REQUEST) -> RESPONSE {
        // todo guard against nil username and pw
        // todo mulitple unwrap and guard?

        if let username = request.username {
            print("hello")
            if let password = request.password {
                print("there")
                return RESPONSE(.SUCCESS)
            }
        }

        return RESPONSE(.FAILED)
    }

    struct Request {
        var username: String?
        var password: String?
    }

    struct Response {
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
    typealias REQUEST = ListAction.Request
    typealias RESPONSE = ListAction.Response

    static func actionType() -> ActionType {
        return .General
    }

    static func run(request: REQUEST) -> RESPONSE {
        if let search = request.search {
            print("hello search")
            return RESPONSE(.SUCCESS)
        }

        return RESPONSE(.FAILED)
    }

    struct Request {
        var search: String?
    }

    struct Response {
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