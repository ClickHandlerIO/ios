import Foundation
import SwiftyJSON

struct WsAddCycleCountItems {

    class Request: WsRequest {
        typealias Response = WsAddCycleCountItems.Response
        
        var cycleCountId: String?
        var countItems: [WsAddCycleCountItems.CountItem]?
        var allowInvalidItems: Bool?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/addcyclecountitems"
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
            
            if let countItemsArrayValue = json["countItems"].array {
                self.countItems = []
                for item in countItemsArrayValue {
                    if let value = WsAddCycleCountItems.CountItem(json: item), var countItems = countItems {
                        countItems.append(value)
                    }
                }
            }
            
            if let allowInvalidItems = json["allowInvalidItems"].bool {
                self.allowInvalidItems = allowInvalidItems
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let cycleCountId = self.cycleCountId {
                dictionary["cycleCountId"] = cycleCountId
            }
            
            if let allowInvalidItems = self.allowInvalidItems {
                dictionary["allowInvalidItems"] = allowInvalidItems
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CYCLE_COUNT_ID_REQUIRED
    case COUNT_ITEM_REQUIRED
    case CYCLE_COUNT_NOT_FOUND
    case INVALID_ITEMS
    case FAILED
}

class CountItem: JSONSerializable {
    var itemNumber: String?
    var lotNumber: String?
    var serialNumber: Int?
    var tagNumber: String?
    var containerId: String?

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
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialNumber = json["serialNumber"].int {
        self.serialNumber = serialNumber
    }
    
    if let tagNumber = json["tagNumber"].string {
        self.tagNumber = tagNumber
    }
    
    if let containerId = json["containerId"].string {
        self.containerId = containerId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let tagNumber = self.tagNumber {
        dictionary["tagNumber"] = tagNumber
    }
    
    if let containerId = self.containerId {
        dictionary["containerId"] = containerId
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsAddCycleCountItems.Code?
    var invalidCycleCountItems: [CycleCountItemEntity]?

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
        if let code = WsAddCycleCountItems.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let invalidCycleCountItemsArrayValue = json["invalidCycleCountItems"].array {
        self.invalidCycleCountItems = []
        for item in invalidCycleCountItemsArrayValue {
            if let value = CycleCountItemEntity(json: item), var invalidCycleCountItems = invalidCycleCountItems {
                invalidCycleCountItems.append(value)
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
