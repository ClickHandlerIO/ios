//
// Created by Chris Jones on 6/28/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

class DatabaseManager {
    static let instance = DatabaseManager()
    var queue: DatabaseQueue? // todo change to using database pool for WAL
    private var key: String = "passme"
    // todo where / how to store encryption key for the db. as well as trigger re-key
    private var databaseFolder = "/db"
    private var databaseFileName = "/movemedical3.sqlite"

    deinit {
        // todo disconnect
    }

    func connect() -> Bool {
        var config = Configuration()
        config.passphrase = key
        do {
            queue = try DatabaseQueue(path: getDbPath(), configuration: config)
            // todo call versioning script
            return true // todo probably switch to callback pattern
        } catch {
            print("Failed to connect to database")
            return false
        }
    }

    func disconnect() {
        if let q = queue {
            // todo close
        }
        queue = nil
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
        // todo version the app
    }
}
