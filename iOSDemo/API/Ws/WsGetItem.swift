import Foundation
import SwiftyJSON

struct WsGetItem {

    class Request: WsRequest {
        typealias Response = WsGetItem.Response
        
        var itemId: String?
        
        class func getPath() -> String {
            return "/inventory/item/getitem"
        }
        
        class func isQueueable() -> Bool {
            return false
        }
        
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
            
            if let itemId = json["itemId"].string {
                self.itemId = itemId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            return dictionary
        }
    }

class ItemDetail: JSONSerializable {
    var id: String?
    var bizUnitId: String?
    var bizUnitName: String?
    var itemNumber: String?
    var skuNumber: String?
    var longDescription: String?
    var shortDescription: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var sizeSequence: Int?
    var unitOfMeasure: UnitOfMeasure?
    var unitOfMeasureQuantity: Int?

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
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let bizUnitName = json["bizUnitName"].string {
        self.bizUnitName = bizUnitName
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let skuNumber = json["skuNumber"].string {
        self.skuNumber = skuNumber
    }
    
    if let longDescription = json["longDescription"].string {
        self.longDescription = longDescription
    }
    
    if let shortDescription = json["shortDescription"].string {
        self.shortDescription = shortDescription
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let sizeSequence = json["sizeSequence"].int {
        self.sizeSequence = sizeSequence
    }
    
    if let unitOfMeasureStringValue = json["unitOfMeasure"].string {
        if let unitOfMeasure = UnitOfMeasure(rawValue: unitOfMeasureStringValue) {
            self.unitOfMeasure = unitOfMeasure
        }
    }
    
    if let unitOfMeasureQuantity = json["unitOfMeasureQuantity"].int {
        self.unitOfMeasureQuantity = unitOfMeasureQuantity
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let bizUnitName = self.bizUnitName {
        dictionary["bizUnitName"] = bizUnitName
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let skuNumber = self.skuNumber {
        dictionary["skuNumber"] = skuNumber
    }
    
    if let longDescription = self.longDescription {
        dictionary["longDescription"] = longDescription
    }
    
    if let shortDescription = self.shortDescription {
        dictionary["shortDescription"] = shortDescription
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let sizeSequence = self.sizeSequence {
        dictionary["sizeSequence"] = sizeSequence
    }
    
    if let unitOfMeasure = self.unitOfMeasure {
        dictionary["unitOfMeasure"] = unitOfMeasure.rawValue
    }
    
    if let unitOfMeasureQuantity = self.unitOfMeasureQuantity {
        dictionary["unitOfMeasureQuantity"] = unitOfMeasureQuantity
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case NOT_FOUND
    case OUT_OF_SCOPE
    case FAILED
}

class Response: JSONSerializable {
    var code: WsGetItem.Code?
    var itemDetail: WsGetItem.ItemDetail?
    var versions: [ItemVersionEntity]?

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
    
    if let codeStringValue = json["code"].string {
        if let code = WsGetItem.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.itemDetail = WsGetItem.ItemDetail(json: json["itemDetail"])
    
    if let versionsArrayValue = json["versions"].array {
        self.versions = []
        for item in versionsArrayValue {
            if let value = ItemVersionEntity(json: item), var versions = versions {
                versions.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let itemDetail = self.itemDetail {
        dictionary["itemDetail"] = itemDetail.asDictionary()
    }
    
    return dictionary
}
}

}
