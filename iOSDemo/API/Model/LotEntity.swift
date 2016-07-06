import Foundation
import GRDBCipher
import SwiftyJSON

class LotEntity: AbstractEntity {
    var itemId: String?
    var itemVersionId: String?
    var lotNumber: String?
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
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
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
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
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
