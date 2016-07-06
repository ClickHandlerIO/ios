import Foundation
import GRDBCipher
import SwiftyJSON

class InventoryTypeEntity: AbstractEntity {
    var organizationId: String?
    var name: String?
    var type_: InventoryType?

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
    
    if let organizationId = json["organizationId"].string {
        self.organizationId = organizationId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let type_StringValue = json["type"].string {
        if let type_ = InventoryType(rawValue: type_StringValue) {
            self.type_ = type_
        }
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let organizationId = self.organizationId {
        dictionary["organizationId"] = organizationId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let type_ = self.type_ {
        dictionary["type"] = type_.rawValue
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
}
