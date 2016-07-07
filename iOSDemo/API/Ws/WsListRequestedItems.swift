import Foundation
import SwiftyJSON

struct WsListRequestedItems {

    class Request: WsRequest {
        typealias Response = WsListRequestedItems.Response
        
        var caseEventId: String?
        var sortBy: WsListRequestedItems.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/event/detail/surgery/listrequesteditems"
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
            
            if let caseEventId = json["caseEventId"].string {
                self.caseEventId = caseEventId
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListRequestedItems.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            return dictionary
        }
    }

enum SortBy: String {
    case QUANTITY
    case ITEM_NUMBER
    case ITEM_LONG_DESC
    case ITEM_SHORT_DESC
    case ITEM_CLASS
    case ITEM_TYPE
    case ITEM_VERSION
    case LOT_NUMBER
    case SERIAL_NUMBER
}

class ItemRequested: JSONSerializable {
    var id: String?
    var quantity: Int?
    var quantityVerified: Int?
    var itemId: String?
    var itemNumber: String?
    var itemLongDesc: String?
    var itemShortDesc: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var itemVersionId: String?
    var version: String?
    var versionStartManuDate: Int?
    var versionEndManuDate: Int?
    var lotId: String?
    var lotNumber: String?
    var lotExpirationDate: Int?
    var lotManuDate: Int?
    var serialId: String?
    var serialNumber: Int?
    var stockId: String?
    var serialExpirationDate: Int?
    var serialManuDate: Int?

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
    
    if let quantity = json["quantity"].int {
        self.quantity = quantity
    }
    
    if let quantityVerified = json["quantityVerified"].int {
        self.quantityVerified = quantityVerified
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemLongDesc = json["itemLongDesc"].string {
        self.itemLongDesc = itemLongDesc
    }
    
    if let itemShortDesc = json["itemShortDesc"].string {
        self.itemShortDesc = itemShortDesc
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
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let version = json["version"].string {
        self.version = version
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
    
    if let serialNumber = json["serialNumber"].int {
        self.serialNumber = serialNumber
    }
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let quantity = self.quantity {
        dictionary["quantity"] = quantity
    }
    
    if let quantityVerified = self.quantityVerified {
        dictionary["quantityVerified"] = quantityVerified
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemLongDesc = self.itemLongDesc {
        dictionary["itemLongDesc"] = itemLongDesc
    }
    
    if let itemShortDesc = self.itemShortDesc {
        dictionary["itemShortDesc"] = itemShortDesc
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let version = self.version {
        dictionary["version"] = version
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
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListRequestedItems.Code?
    var itemsRequested: [WsListRequestedItems.ItemRequested]?

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
        if let code = WsListRequestedItems.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let itemsRequestedArrayValue = json["itemsRequested"].array {
        self.itemsRequested = []
        for item in itemsRequestedArrayValue {
            if let value = WsListRequestedItems.ItemRequested(json: item), var itemsRequested = itemsRequested {
                itemsRequested.append(value)
            }
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
