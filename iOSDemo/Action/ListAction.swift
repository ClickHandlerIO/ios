//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

struct ListAction: DatabaseActionProtocol {
    typealias Request = ListAction.REQ
    typealias Response = ListAction.RESP

    static func actionType() -> ActionType {
        return .DatabaseReadUncommitted
    }

    static func run(request: Request, db: Database, operation: NSOperation, onCompletion: ((Response) -> Void)) throws {
        if operation.cancelled {
            onCompletion(Response(.CANCELLED))
            return
        }

        guard let search = request.search else {
            onCompletion(Response(.FAILED))
            return
        }

        let facilities = FacilityEntity.fetchAll(db, "SELECT * FROM FacilityEntity")
        for f in facilities {
            print("Facility", f.id, f.name, f.createAddress())
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