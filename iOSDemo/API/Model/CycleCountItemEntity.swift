import Foundation
import GRDBCipher
import SwiftyJSON

class CycleCountItemEntity: AbstractEntity {
    var countId: String?
    var itemNumber: String?
    var lotSerialNumber: String?
    var tagNumber: String?
    var itemId: String?
    var itemVersionId: String?
    var lotId: String?
    var serialId: String?
    var tagId: String?
    var containerString: String?
    var containerType: StockContainerType?
    var containerId: String?
    var quantityCounted: Int?
    var quantityExpected: Int?
    var quantityDiff: Int?

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
    
    if let countId = json["countId"].string {
        self.countId = countId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let lotSerialNumber = json["lotSerialNumber"].string {
        self.lotSerialNumber = lotSerialNumber
    }
    
    if let tagNumber = json["tagNumber"].string {
        self.tagNumber = tagNumber
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
    
    if let containerString = json["containerString"].string {
        self.containerString = containerString
    }
    
    if let containerTypeStringValue = json["containerType"].string {
        if let containerType = StockContainerType(rawValue: containerTypeStringValue) {
            self.containerType = containerType
        }
    }
    
    if let containerId = json["containerId"].string {
        self.containerId = containerId
    }
    
    if let quantityCounted = json["quantityCounted"].int {
        self.quantityCounted = quantityCounted
    }
    
    if let quantityExpected = json["quantityExpected"].int {
        self.quantityExpected = quantityExpected
    }
    
    if let quantityDiff = json["quantityDiff"].int {
        self.quantityDiff = quantityDiff
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let countId = self.countId {
        dictionary["countId"] = countId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let lotSerialNumber = self.lotSerialNumber {
        dictionary["lotSerialNumber"] = lotSerialNumber
    }
    
    if let tagNumber = self.tagNumber {
        dictionary["tagNumber"] = tagNumber
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
    
    if let containerString = self.containerString {
        dictionary["containerString"] = containerString
    }
    
    if let containerType = self.containerType {
        dictionary["containerType"] = containerType.rawValue
    }
    
    if let containerId = self.containerId {
        dictionary["containerId"] = containerId
    }
    
    if let quantityCounted = self.quantityCounted {
        dictionary["quantityCounted"] = quantityCounted
    }
    
    if let quantityExpected = self.quantityExpected {
        dictionary["quantityExpected"] = quantityExpected
    }
    
    if let quantityDiff = self.quantityDiff {
        dictionary["quantityDiff"] = quantityDiff
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
