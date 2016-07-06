//
// Created by Chris Jones on 6/27/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

class FacilityEntity_Manual: BaseRecord {
    var id: String?
    var name: String?
    var bodySide: BodySide_Manual?

    // todo save a Date
    // any other types?

    // Ship To Address
    var addressLine1: String?
    var addressLine2: String?
    var addressLine3: String?
    var addressCity: String?
    var addressState: String?
    var addressPostalCode: String?
    var addressCountry: String?

    override init() {
        super.init()
    }

    // SQL Translation

    override class func databaseTableCreateSql() -> String {
        return "CREATE TABLE IF NOT EXISTS " + databaseTableName() + " (" +
                "id TEXT PRIMARY KEY" +
                ", name TEXT" +
                ", bodySide TEXT" +
                ", addressLine1 TEXT" +
                ", addressLine2 TEXT" +
                ", addressLine3 TEXT" +
                ", addressCity TEXT" +
                ", addressState TEXT" +
                ", addressPostalCode TEXT" +
                ", addressCountry TEXT" +
                ")"
    }

    required init(_ row: Row) {
        id = row.value(named: "id")
        name = row.value(named: "name")
        bodySide = row.value(named: "bodySide") as BodySide_Manual?
        addressLine1 = row.value(named: "addressLine1")
        addressLine2 = row.value(named: "addressLine2")
        addressLine3 = row.value(named: "addressLine3")
        addressCity = row.value(named: "addressCity")
        addressState = row.value(named: "addressState")
        addressPostalCode = row.value(named: "addressPostalCode")
        addressCountry = row.value(named: "addressCountry")
        super.init(row)
    }

    override var persistentDictionary: [String:DatabaseValueConvertible?] {
        return [
                "id": id,
                "name": name,
                "bodySide": bodySide,
                "addressLine1": addressLine1,
                "addressLine2": addressLine2,
                "addressLine3": addressLine3,
                "addressCity": addressCity,
                "addressState": addressState,
                "addressPostalCode": addressPostalCode,
                "addressCountry": addressCountry,
        ]
    }

    // Embedded Types

    func createAddress() -> Address_Manual {
        var address = Address_Manual()
        address.line1 = self.addressLine1
        address.line2 = self.addressLine2
        address.line3 = self.addressLine3
        address.city = self.addressCity
        address.state = self.addressState
        address.postalCode = self.addressPostalCode
        address.country = self.addressCountry
        return address
    }

    func applyAddress(address: Address_Manual) {
        self.addressLine1 = address.line1
        self.addressLine2 = address.line2
        self.addressLine3 = address.line3
        self.addressCity = address.city
        self.addressState = address.state
        self.addressPostalCode = address.postalCode
        self.addressCountry = address.country
    }
}
