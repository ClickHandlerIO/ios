import Foundation
import SwiftyJSON

struct WsGetCycleCountItem {

    class Request: WsRequest {
        typealias Response = WsGetCycleCountItem.Response
        
        var cycleCountItemId: String?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/getcyclecountitem"
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
            
            if let cycleCountItemId = json["cycleCountItemId"].string {
                self.cycleCountItemId = cycleCountItemId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let cycleCountItemId = self.cycleCountItemId {
                dictionary["cycleCountItemId"] = cycleCountItemId
            }
            
            return dictionary
        }
    }

class CycleCountItemDetail: JSONSerializable {
    var stockIds: [String]?
    var adjustments: [WsGetCycleCountItem.Adjustment]?
    var id: String?
    var countId: String?
    var countNumber: Int?
    var countLocation: Location?
    var itemNumber: String?
    var lotSerialNumber: String?
    var tagNumber: String?
    var itemId: String?
    var itemVersionId: String?
    var lotId: String?
    var serialId: String?
    var tagId: String?
    var container: Container?
    var quantityCounted: Int?
    var quantityExpected: Int?
    var quantityDiff: Int?

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
    
    if let stockIdsArrayValue = json["stockIds"].array {
        self.stockIds = []
        for item in stockIdsArrayValue {
            if var stockIds = stockIds, let itemValue = item.string {
                stockIds.append(itemValue)
            }
        }
    }
    
    if let adjustmentsArrayValue = json["adjustments"].array {
        self.adjustments = []
        for item in adjustmentsArrayValue {
            if let value = WsGetCycleCountItem.Adjustment(json: item), var adjustments = adjustments {
                adjustments.append(value)
            }
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let countId = json["countId"].string {
        self.countId = countId
    }
    
    if let countNumber = json["countNumber"].int {
        self.countNumber = countNumber
    }
    
    self.countLocation = Location(json: json["countLocation"])
    
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
    
    self.container = Container(json: json["container"])
    
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

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let countId = self.countId {
        dictionary["countId"] = countId
    }
    
    if let countNumber = self.countNumber {
        dictionary["countNumber"] = countNumber
    }
    
    if let countLocation = self.countLocation {
        dictionary["countLocation"] = countLocation.asDictionary()
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
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
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
}

class Response: JSONSerializable {
    var code: WsGetCycleCountItem.Code?
    var detail: WsGetCycleCountItem.CycleCountItemDetail?

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
        if let code = WsGetCycleCountItem.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetCycleCountItem.CycleCountItemDetail(json: json["detail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let detail = self.detail {
        dictionary["detail"] = detail.asDictionary()
    }
    
    return dictionary
}
}

class Adjustment: JSONSerializable {
    var id: String?
    var stockId: String?
    var container: Container?
    var reason: String?
    var date: Int?
    var userId: String?
    var userDisplayName: String?

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
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
    
    self.container = Container(json: json["container"])
    
    if let reason = json["reason"].string {
        self.reason = reason
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    if let userDisplayName = json["userDisplayName"].string {
        self.userDisplayName = userDisplayName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
    }
    
    if let reason = self.reason {
        dictionary["reason"] = reason
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let userDisplayName = self.userDisplayName {
        dictionary["userDisplayName"] = userDisplayName
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case CYCLE_COUNT_ITEM_ID_REQUIRED
    case ITEM_NOT_FOUND
    case CYCLE_NOT_FOUND
    case FAILED
}

}
