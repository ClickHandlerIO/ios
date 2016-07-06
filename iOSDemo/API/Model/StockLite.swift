import Foundation
import SwiftyJSON

class StockLite: JSONSerializable {
    var id: String?
    var itemId: String?
    var itemNumber: String?
    var itemType: ItemType?
    var itemClass: ItemClass?
    var lotId: String?
    var lotNumber: String?
    var serialId: String?
    var serialNumber: String?

// JSON

required init() {
}

convenience required init?(json: JSON?) {
    guard let json = json else {
        return nil
    }
    self.init()
    self.merge(json)
}

func merge(json: JSON?) {
    guard let json = json else {
        return
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let serialNumber = json["serialNumber"].string {
        self.serialNumber = serialNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    return dictionary
}
}
