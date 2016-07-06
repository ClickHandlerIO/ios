import Foundation
import GRDBCipher
import SwiftyJSON

class SerialEntity: AbstractEntity {
    var itemId: String?
    var itemVersionId: String?
    var serialNumber: Int?
    var stockId: String?
    var tagId: String?
    var serialRef: String?
    var expirationDate: Int?
    var manufactureDate: Int?

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
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let serialNumber = json["serialNumber"].int {
        self.serialNumber = serialNumber
    }
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
    
    if let tagId = json["tagId"].string {
        self.tagId = tagId
    }
    
    if let serialRef = json["serialRef"].string {
        self.serialRef = serialRef
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    if let tagId = self.tagId {
        dictionary["tagId"] = tagId
    }
    
    if let serialRef = self.serialRef {
        dictionary["serialRef"] = serialRef
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
