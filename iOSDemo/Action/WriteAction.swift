//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

struct WriteAction: DatabaseActionProtocol {
    typealias Request = WriteAction.REQ
    typealias Response = WriteAction.RESP

    static func actionType() -> ActionType {
        return .DatabaseWrite
    }

    static func run(request: Request, db: Database, operation: NSOperation, onCompletion: ((Response) -> Void)) throws {
        if operation.cancelled {
            onCompletion(Response(.CANCELLED))
            return
        }

        let facility = FacilityEntity()
        facility.id = "c"
        facility.name = "ScrippsC"
        facility.bodySide = .BILATERAL

        var addr = Address()
        addr.line1 = "Aln1"
        addr.line2 = "Bln2"
        addr.line3 = "Cln3"
        addr.city = "cty"
        addr.state = "st"
        addr.postalCode = "postcde"
        addr.country = "cntry"
        facility.applyAddress(addr)
        try facility.save(db)

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