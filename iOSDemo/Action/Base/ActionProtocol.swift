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
    static func run(request: Request, conn: Database?, operation: NSOperation) throws -> Response?
}

func getDbPath() -> String {
    let documentsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    var path = documentsDir + "/db"

    if !NSFileManager.defaultManager().fileExistsAtPath(path) {
        do {
            try NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Failed to create directory: " + path)
        }
    }
    path += "/snowreport5.sqlite"
    return path;
}

extension DatabaseActionProtocol {
    /*static func run(request: Request, operation: NSOperation) -> Response? {
        do {
            var config = Configuration()
            config.passphrase = "passme"
            let dbQueue = try DatabaseQueue(path: getDbPath(), configuration: config)

            switch actionType() {
            case .General:
                fatalError("General ActionType is invalid for DatabaseActionProtocol implementation")
                return nil
            case .DatabaseWrite:
                try dbQueue.inDatabase {
                    db in
                    return try run(request, conn: db, operation: operation)
                }
            case .DatabaseReadUncommitted:
                try dbQueue.inDatabase {
                    db in
                    return try run(request, conn: db, operation: operation)
                }
            }
//        } catch unknownError {
//            print("DatabaseActionProtocol unknown error \(unknownError)")
        } catch {
            print("DatabaseActionProtocol error catch")
            return nil
        }
        return nil

    }*/
}