//
// Created by Chris Jones on 6/28/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

class DatabaseManager {
    static let instance = DatabaseManager()

    var dbPool: DatabasePool?
    private var key: String = "passme"
    private var databaseFolder = "/db"
    private var databaseFileName = "/movemedical4.sqlite"

    deinit {
        // todo disconnect
    }

    // todo make this async with callback
    func open() -> Bool {
        var config = Configuration()
        config.passphrase = key
        config.fileAttributes = [NSFileProtectionKey: NSFileProtectionComplete]
        config.foreignKeysEnabled = false
        config.maximumReaderCount = 10
        // config this as a dev mode thing
        config.trace = {
            print($0)
        }

        do {
            dbPool = try DatabasePool(path: getDbPath(), configuration: config)
            // todo call versioning script
            return true // todo probably switch to callback pattern
        } catch {
            print("Failed to connect to database")
            return false
        }
    }

    func close() {
        dbPool = nil
    }

    func rekey(passphrase: String) {
        // todo where / how to store encryption key for the db. as well as trigger re-key
//        dbQueue.changePassphrase("abc")
    }

    private func getDbPath() -> String {
        let documentsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        var path = documentsDir + databaseFolder
        if !NSFileManager.defaultManager().fileExistsAtPath(path) {
            do {
                try NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Failed to create directory: " + path)
            }
        }
        path += databaseFileName
        return path;
    }

    private func version() {
        // todo version the app (see docs on using their versioning mechanism)
    }
}
