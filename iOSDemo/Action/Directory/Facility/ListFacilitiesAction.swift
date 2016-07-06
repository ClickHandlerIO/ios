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
        return .DatabaseWrite
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

        onCompletion(Response(FacilityEntity_Manual.fetchAll(db, "SELECT * FROM FacilityEntity")))
    }

    struct REQ {
        var search: String?

        init() {}

        init(_ search: String?) {
            self.search = search
        }
    }

    struct RESP {
        var code: Code
        var data: [FacilityEntity_Manual]?

        init() {
            code = .SUCCESS
        }

        init(_ data: [FacilityEntity_Manual]?) {
            self.init()
            self.data = data
        }

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