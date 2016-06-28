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
            // db conn config / open (todo move this)
//            var config = Configuration()
//            config.passphrase = "passme"
//            let dbQueue = try DatabaseQueue(path: getDbPath(), configuration: config)

            switch actionType() {
            case .General:
                fatalError("General ActionType is invalid for DatabaseActionProtocol implementation")
            case .DatabaseWrite:
                try DatabaseManager.instance.queue?.inDatabase {
                    db in
                    try run(request, db: db, operation: operation, onCompletion: onCompletion)
                }
            case .DatabaseReadUncommitted:
                try DatabaseManager.instance.queue?.inDatabase {
                    db in
                    try run(request, db: db, operation: operation, onCompletion: onCompletion)
                }
            }
        } catch let err {
            print("DatabaseActionProtocol error \(err)")
        } catch {
            print("DatabaseActionProtocol empty error")
        }
    }

//    static func getDbPath() -> String {
//        let documentsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
//        var path = documentsDir + "/db"
//
//        if !NSFileManager.defaultManager().fileExistsAtPath(path) {
//            do {
//                try NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
//            } catch {
//                print("Failed to create directory: " + path)
//            }
//        }
//        path += "/snowreport5.sqlite"
//        return path;
//    }
}