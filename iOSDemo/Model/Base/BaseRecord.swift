//
// Created by Chris Jones on 6/28/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

class BaseRecord: Record {
    override class func databaseTableName() -> String {
        return String(self)
    }

    class func databaseTableCreateSql() -> String {
        fatalError("subclass must override")
    }
}