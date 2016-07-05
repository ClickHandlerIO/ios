//
// Created by Chris Jones on 7/1/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher
import SwiftyJSON

class UserEntity: BaseRecord, JSONSerializable {
    var id: String?
    var email: String?

    override required init() {
        super.init()
    }

    // SQL

    override class func databaseTableCreateSql() -> String {
        return "CREATE TABLE IF NOT EXISTS " + databaseTableName() + " (" +
                "id TEXT PRIMARY KEY" +
                ", email TEXT" +
                ")"
    }

    required init(_ row: Row) {
        id = row.value(named: "id")
        email = row.value(named: "email")
        super.init(row)
    }

    override var persistentDictionary: [String:DatabaseValueConvertible?] {
        return [
                "id": id,
                "email": email,
        ]
    }

    // JSON

    public convenience required init?(json: JSON?) {
        guard let json = json else {
            return nil
        }

        self.init()
        self.merge(json)
    }

    public func merge(json: JSON?) {
        guard let json = json else {
            return
        }

        if let id = json["id"].string {
            self.id = id
        }

        if let email = json["email"].string {
            self.email = email
        }
    }

    func asDictionary() -> [String:AnyObject] {
        var dictionary = [String: AnyObject]()

        if let id = self.id {
            dictionary["id"] = id
        }

            dictionary["email"] = email

        return dictionary
    }
}
