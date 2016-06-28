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

    static func run(request: Request, operation: NSOperation, onCompletion: ((Response) -> Void)) {
        if operation.cancelled {
            onCompletion(Response(.CANCELLED))
            return
        }

        guard let search = request.search else {
            onCompletion(Response(.FAILED))
            return
        }

        var resp = Response(.SUCCESS)
        resp.data = ["1", "2", "3", search]
        onCompletion(resp)
    }

    struct REQ {
        var search: String?
    }

    struct RESP {
        var code: Code
        var data: [String]?

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