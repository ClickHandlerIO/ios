import Foundation
import GRDBCipher
import SwiftyJSON

class ItemVersionEntity: AbstractEntity {
    var itemId: String?
    var version: String?
    var startManufactureDate: Int?
    var endManufactureDate: Int?
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
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let version = json["version"].string {
        self.version = version
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let version = self.version {
        dictionary["version"] = version
    }
    
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
}
