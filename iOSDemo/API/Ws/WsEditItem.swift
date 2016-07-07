import Foundation
import SwiftyJSON

struct WsEditItem {

    class Request: WsRequest {
        typealias Response = WsEditItem.Response
        
        var id: String?
        var bizUnitId: String?
        var itemNumber: String?
        var skuNumber: String?
        var longDescription: String?
        var shortDescription: String?
        var itemClass: ItemClass?
        var itemType: ItemType?
        var sizeSequence: Int?
        var unitOfMeasure: UnitOfMeasure?
        var unitOfMeasureQuantity: Int?
        var kitOnFly: Bool?
        
        class func getPath() -> String {
            return "/inventory/item/edititem"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
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
            
            if let kitOnFly = json["kitOnFly"].bool {
                self.kitOnFly = kitOnFly
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
            
            if let kitOnFly = self.kitOnFly {
                dictionary["kitOnFly"] = kitOnFly
            }
            
            return dictionary
        }
    }

enum Code: String {
    case INVALID_UNIT_OF_MEASURE_QUANTITY
    case UNIT_OF_MEASURE_REQUIRED
    case BIZ_UNIT_ID_REQUIRED
    case ITEM_NUMBER_REQUIRED
    case SKU_NUMBER_REQUIRED
    case ITEM_CLASS_REQUIRED
    case ITEM_TYPE_REQUIRED
    case ITEM_NOT_FOUND
    case NOT_FOUND
    case SUCCESS
    case ITEM_ID_REQUIRED
    case OUT_OF_SCOPE
    case FAILED
}

class Response: JSONSerializable {
    var code: WsEditItem.Code?

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
        if let code = WsEditItem.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    return dictionary
}
}

}
