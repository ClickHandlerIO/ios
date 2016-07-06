import Foundation
import GRDBCipher
import SwiftyJSON

class ItemEntity: AbstractEntity {
    var organizationId: String?
    var bizUnitId: String?
    var itemNumber: String?
    var sizeSequence: Int?
    var skuNumber: String?
    var longDescription: String?
    var shortDescription: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var kitOnFly: Bool?
    var unitOfMeasure: UnitOfMeasure?
    var unitOfMeasureQuantity: Int?
    var linkedToItemId: String?
    var containerCount: Int?
    var kitTrayNumber: Int?

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
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let sizeSequence = json["sizeSequence"].int {
        self.sizeSequence = sizeSequence
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
    
    if let kitOnFly = json["kitOnFly"].bool {
        self.kitOnFly = kitOnFly
    }
    
    if let unitOfMeasureStringValue = json["unitOfMeasure"].string {
        if let unitOfMeasure = UnitOfMeasure(rawValue: unitOfMeasureStringValue) {
            self.unitOfMeasure = unitOfMeasure
        }
    }
    
    if let unitOfMeasureQuantity = json["unitOfMeasureQuantity"].int {
        self.unitOfMeasureQuantity = unitOfMeasureQuantity
    }
    
    if let linkedToItemId = json["linkedToItemId"].string {
        self.linkedToItemId = linkedToItemId
    }
    
    if let containerCount = json["containerCount"].int {
        self.containerCount = containerCount
    }
    
    if let kitTrayNumber = json["kitTrayNumber"].int {
        self.kitTrayNumber = kitTrayNumber
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let organizationId = self.organizationId {
        dictionary["organizationId"] = organizationId
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let sizeSequence = self.sizeSequence {
        dictionary["sizeSequence"] = sizeSequence
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
    
    if let kitOnFly = self.kitOnFly {
        dictionary["kitOnFly"] = kitOnFly
    }
    
    if let unitOfMeasure = self.unitOfMeasure {
        dictionary["unitOfMeasure"] = unitOfMeasure.rawValue
    }
    
    if let unitOfMeasureQuantity = self.unitOfMeasureQuantity {
        dictionary["unitOfMeasureQuantity"] = unitOfMeasureQuantity
    }
    
    if let linkedToItemId = self.linkedToItemId {
        dictionary["linkedToItemId"] = linkedToItemId
    }
    
    if let containerCount = self.containerCount {
        dictionary["containerCount"] = containerCount
    }
    
    if let kitTrayNumber = self.kitTrayNumber {
        dictionary["kitTrayNumber"] = kitTrayNumber
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
