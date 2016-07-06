//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

protocol ActionProtocol {
    associatedtype Request
    associatedtype Response

    static func actionType() -> ActionType

    static func run(request: Request, operation: NSOperation, onCompletion: ((Response) -> Void))
}

protocol DatabaseActionProtocol: ActionProtocol {
    static func run(request: Request, db: Database, operation: NSOperation, onCompletion: ((Response) -> Void)) throws
}

extension DatabaseActionProtocol {
    static func run(request: Request, operation: NSOperation, onCompletion: ((Response) -> Void)) {
        do {
            switch actionType() {
            case .General:
                fatalError("General ActionType is invalid for DatabaseActionProtocol implementation")
            case .DatabaseWrite:
                try DatabaseManager.instance.dbPool?.write {
                    db in
                    try run(request, db: db, operation: operation, onCompletion: onCompletion)
                }
            case .DatabaseReadUncommitted:
                try DatabaseManager.instance.dbPool?.read {
                    db in
                    try run(request, db: db, operation: operation, onCompletion: onCompletion)
                }
            }
        } catch {
            print("DatabaseActionProtocol error")
        }
    }
}