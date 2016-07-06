import Foundation
import GRDBCipher
import SwiftyJSON

class OrgEntity: AbstractEntity {
    var name: String?
    var type_: OrgType?
    var addressLine1: String?
    var addressLine2: String?
    var addressLine3: String?
    var addressCity: String?
    var addressState: String?
    var addressPostalCode: String?
    var addressCountry: String?
    var active: Bool?

// JSON

required init() {
    super.init()
}

convenience required init?(json: JSON?) {
    guard let json = json else {
        return nil
    }
    self.init()
    self.merge(json)
}

override func merge(json: JSON?) {
    guard let json = json else {
        return
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let type_StringValue = json["type"].string {
        if let type_ = OrgType(rawValue: type_StringValue) {
            self.type_ = type_
        }
    }
    
    if let address = Address(json: json["address"]) {
        self.addressLine1 = address.line1
        self.addressLine2 = address.line2
        self.addressLine3 = address.line3
        self.addressCity = address.city
        self.addressState = address.state
        self.addressPostalCode = address.postalCode
        self.addressCountry = address.country
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let type_ = self.type_ {
        dictionary["type"] = type_.rawValue
    }
    
    dictionary["address"] = createAddress().asDictionary()
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    return dictionary
}

// SQL

override class func databaseTableCreateSql() -> String {
    return ""
}

required init(_ row: Row) {
    super.init(row)
}

override var persistentDictionary: [String:DatabaseValueConvertible?] {
    return [:]
}

// Address

func createAddress() -> Address {
    let address = Address()
    address.line1 = self.addressLine1
    address.line2 = self.addressLine2
    address.line3 = self.addressLine3
    address.city = self.addressCity
    address.state = self.addressState
    address.postalCode = self.addressPostalCode
    address.country = self.addressCountry
    return address
}

func applyAddress(address: Address) {
    self.addressLine1 = address.line1
    self.addressLine2 = address.line2
    self.addressLine3 = address.line3
    self.addressCity = address.city
    self.addressState = address.state
    self.addressPostalCode = address.postalCode
    self.addressCountry = address.country
}
}
