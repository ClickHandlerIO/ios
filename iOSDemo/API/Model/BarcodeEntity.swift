import Foundation
import GRDBCipher
import SwiftyJSON

class BarcodeEntity: AbstractEntity {
    var type_: BarcodeType?
    var value: String?
    var itemId: String?
    var itemVersionId: String?
    var lotId: String?
    var serialId: String?
    var tagId: String?

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
    
    if let type_StringValue = json["type"].string {
        if let type_ = BarcodeType(rawValue: type_StringValue) {
            self.type_ = type_
        }
    }
    
    if let value = json["value"].string {
        self.value = value
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let tagId = json["tagId"].string {
        self.tagId = tagId
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let type_ = self.type_ {
        dictionary["type"] = type_.rawValue
    }
    
    if let value = self.value {
        dictionary["value"] = value
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let tagId = self.tagId {
        dictionary["tagId"] = tagId
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
