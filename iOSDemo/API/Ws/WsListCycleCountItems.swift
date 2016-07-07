import Foundation
import SwiftyJSON

struct WsListCycleCountItems {

    class Request: WsRequest {
        typealias Response = WsListCycleCountItems.Response
        
        var cycleCountId: String?
        var itemIds: [String]?
        var containerIds: [String]?
        var sortBy: WsListCycleCountItems.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/listcyclecountitems"
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
            
            if let cycleCountId = json["cycleCountId"].string {
                self.cycleCountId = cycleCountId
            }
            
            if let itemIdsArrayValue = json["itemIds"].array {
                self.itemIds = []
                for item in itemIdsArrayValue {
                    if var itemIds = itemIds, let itemValue = item.string {
                        itemIds.append(itemValue)
                    }
                }
            }
            
            if let containerIdsArrayValue = json["containerIds"].array {
                self.containerIds = []
                for item in containerIdsArrayValue {
                    if var containerIds = containerIds, let itemValue = item.string {
                        containerIds.append(itemValue)
                    }
                }
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListCycleCountItems.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let cycleCountId = self.cycleCountId {
                dictionary["cycleCountId"] = cycleCountId
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            return dictionary
        }
    }

class CycleCountItemLite: JSONSerializable {
    var id: String?
    var itemNumber: String?
    var itemId: String?
    var itemType: ItemType?
    var lotSerialNumber: String?
    var lotId: String?
    var serialId: String?
    var tagNumber: String?
    var tagId: String?
    var container: Container?
    var qtyCounted: Int?
    var qtyExpected: Int?
    var qtyDiff: Int?

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
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let lotSerialNumber = json["lotSerialNumber"].string {
        self.lotSerialNumber = lotSerialNumber
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let tagNumber = json["tagNumber"].string {
        self.tagNumber = tagNumber
    }
    
    if let tagId = json["tagId"].string {
        self.tagId = tagId
    }
    
    self.container = Container(json: json["container"])
    
    if let qtyCounted = json["qtyCounted"].int {
        self.qtyCounted = qtyCounted
    }
    
    if let qtyExpected = json["qtyExpected"].int {
        self.qtyExpected = qtyExpected
    }
    
    if let qtyDiff = json["qtyDiff"].int {
        self.qtyDiff = qtyDiff
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let lotSerialNumber = self.lotSerialNumber {
        dictionary["lotSerialNumber"] = lotSerialNumber
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let tagNumber = self.tagNumber {
        dictionary["tagNumber"] = tagNumber
    }
    
    if let tagId = self.tagId {
        dictionary["tagId"] = tagId
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
    }
    
    if let qtyCounted = self.qtyCounted {
        dictionary["qtyCounted"] = qtyCounted
    }
    
    if let qtyExpected = self.qtyExpected {
        dictionary["qtyExpected"] = qtyExpected
    }
    
    if let qtyDiff = self.qtyDiff {
        dictionary["qtyDiff"] = qtyDiff
    }
    
    return dictionary
}
}

enum SortBy: String {
    case ITEM_NUMBER
    case QTY_COUNTED
    case QTY_EXPECTED
    case QTY_DIFF
}

enum Code: String {
    case SUCCESS
    case CYCLE_COUNT_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListCycleCountItems.Code?
    var cycleCountItems: [WsListCycleCountItems.CycleCountItemLite]?

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
        if let code = WsListCycleCountItems.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let cycleCountItemsArrayValue = json["cycleCountItems"].array {
        self.cycleCountItems = []
        for item in cycleCountItemsArrayValue {
            if let value = WsListCycleCountItems.CycleCountItemLite(json: item), var cycleCountItems = cycleCountItems {
                cycleCountItems.append(value)
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
