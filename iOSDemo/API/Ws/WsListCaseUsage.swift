import Foundation
import SwiftyJSON

struct WsListCaseUsage {

    class Request: WsRequest {
        typealias Response = WsListCaseUsage.Response
        
        var caseEventId: String?
        var sortBy: WsListCaseUsage.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/event/detail/surgery/listcaseusage"
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
                if let sortBy = WsListCaseUsage.SortBy(rawValue: sortByStringValue) {
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

class Usage: JSONSerializable {
    var id: String?
    var caseUsageDisposition: CaseUsageDisposition?
    var note: String?
    var locationHint: LocationHint?
    var stockId: String?
    var expirationDate: Int?
    var inventoryTypeId: String?
    var inventoryTypeName: String?
    var adjustmentId: String?
    var location: Location?
    var container: Container?
    var itemId: String?
    var itemNumber: String?
    var itemLongDesc: String?
    var itemShortDesc: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var itemVersionId: String?
    var version: String?
    var lotId: String?
    var lotNumber: String?
    var lotExpirationDate: Int?
    var lotManuDate: Int?
    var serialId: String?
    var serialNumber: Int?
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
    
    if let caseUsageDispositionStringValue = json["caseUsageDisposition"].string {
        if let caseUsageDisposition = CaseUsageDisposition(rawValue: caseUsageDispositionStringValue) {
            self.caseUsageDisposition = caseUsageDisposition
        }
    }
    
    if let note = json["note"].string {
        self.note = note
    }
    
    if let locationHintStringValue = json["locationHint"].string {
        if let locationHint = LocationHint(rawValue: locationHintStringValue) {
            self.locationHint = locationHint
        }
    }
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
    
    if let inventoryTypeId = json["inventoryTypeId"].string {
        self.inventoryTypeId = inventoryTypeId
    }
    
    if let inventoryTypeName = json["inventoryTypeName"].string {
        self.inventoryTypeName = inventoryTypeName
    }
    
    if let adjustmentId = json["adjustmentId"].string {
        self.adjustmentId = adjustmentId
    }
    
    self.location = Location(json: json["location"])
    
    self.container = Container(json: json["container"])
    
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
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let caseUsageDisposition = self.caseUsageDisposition {
        dictionary["caseUsageDisposition"] = caseUsageDisposition.rawValue
    }
    
    if let note = self.note {
        dictionary["note"] = note
    }
    
    if let locationHint = self.locationHint {
        dictionary["locationHint"] = locationHint.rawValue
    }
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    if let inventoryTypeId = self.inventoryTypeId {
        dictionary["inventoryTypeId"] = inventoryTypeId
    }
    
    if let inventoryTypeName = self.inventoryTypeName {
        dictionary["inventoryTypeName"] = inventoryTypeName
    }
    
    if let adjustmentId = self.adjustmentId {
        dictionary["adjustmentId"] = adjustmentId
    }
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
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
    
    return dictionary
}
}

enum SortBy: String {
    case CASE_USAGE_DISPOSITION
    case INVENTORY_TYPE
    case USAGE_CAPTURE_TYPE
    case EXPIRATION_DATE
    case NOTE
    case ITEM_NUMBER
    case ITEM_LONG_DESC
    case ITEM_SHORT_DESC
    case ITEM_CLASS
    case ITEM_TYPE
    case ITEM_VERSION
    case LOT_NUMBER
    case SERIAL_NUMBER
}

class Response: JSONSerializable {
    var code: WsListCaseUsage.Code?
    var usages: [WsListCaseUsage.Usage]?

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
        if let code = WsListCaseUsage.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let usagesArrayValue = json["usages"].array {
        self.usages = []
        for item in usagesArrayValue {
            if let value = WsListCaseUsage.Usage(json: item), var usages = usages {
                usages.append(value)
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

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

}
