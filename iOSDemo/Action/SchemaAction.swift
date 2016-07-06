//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

struct SchemaAction: DatabaseActionProtocol {
    typealias Request = SchemaAction.REQ
    typealias Response = SchemaAction.RESP

    static func actionType() -> ActionType {
        return .DatabaseWrite
    }

    static func run(request: Request, db: Database, operation: NSOperation, onCompletion: ((Response) -> Void)) throws {
        if operation.cancelled {
            onCompletion(Response(.CANCELLED))
            return
        }
        try db.execute(FacilityEntity_Manual.databaseTableCreateSql())
        onCompletion(Response(.SUCCESS))
    }

    struct REQ {
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