//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

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