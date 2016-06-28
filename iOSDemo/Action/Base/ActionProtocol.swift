//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

protocol ActionProtocol {
    associatedtype Request
    associatedtype Response

    static func actionType() -> ActionType

    static func run(request: Request, operation: NSOperation) -> Response
}

protocol DatabaseActionProtocol: ActionProtocol {
    static func run(request: Request, conn: AnyObject, operation: NSOperation) -> Response
}

extension DatabaseActionProtocol {
    static func run(request: Request, operation: NSOperation) -> Response {
        var conn: AnyObject
        // TODO provide actual connections
        switch actionType() {
        case .General:
            fatalError("General ActionType is invalid for DatabaseActionProtocol implementation")
        case .DatabaseWrite:
            conn = "writeconn"
        case .DatabaseReadUncommitted:
            conn = "readuncommitted"
        }
        return run(request, conn: conn, operation: operation)
    }
}