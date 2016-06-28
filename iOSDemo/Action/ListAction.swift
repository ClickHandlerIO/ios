//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

struct ListAction: DatabaseActionProtocol {
    typealias Request = ListAction.REQ
    typealias Response = ListAction.RESP

    static func actionType() -> ActionType {
        return .DatabaseWrite
    }

    static func run(request: Request, conn: AnyObject, operation: NSOperation) -> Response {
        if operation.cancelled {
            return Response(.CANCELLED)
        }

        if let search = request.search {
//            print("hello search")
            var resp = Response(.SUCCESS)
            resp.data = ["1","2","3"]
            return resp
        }

        return Response(.FAILED)
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