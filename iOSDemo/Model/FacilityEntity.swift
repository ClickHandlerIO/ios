//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

class FacilityEntity: Record {
    var id: String?
    var name: String?

    override class func databaseTableName() -> String {
        print("classname: " + String(self))
        return String(self)
    }

    override init() {
        super.init()
    }

    required init(_ row: Row) {
        id = row.value(named: "id")
        name = row.value(named: "name")
        super.init(row)
    }

    override var persistentDictionary: [String:DatabaseValueConvertible?] {
        return [
                "id": id,
                "name": name
        ]
    }

    override func didInsertWithRowID(rowID: Int64, forColumn column: String?) {
    }
}
