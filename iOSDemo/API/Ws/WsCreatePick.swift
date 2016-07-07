import Foundation
import SwiftyJSON

struct WsCreatePick {

    class Request: WsRequest {
        typealias Response = WsCreatePick.Response
        
        var pickSources: [WsCreatePick.PickSource]?
        var autoRelease: Bool?
        
        class func getPath() -> String {
            return "/inventory/sourcing/createpick"
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
            
            if let pickSourcesArrayValue = json["pickSources"].array {
                self.pickSources = []
                for item in pickSourcesArrayValue {
                    if let value = WsCreatePick.PickSource(json: item), var pickSources = pickSources {
                        pickSources.append(value)
                    }
                }
            }
            
            if let autoRelease = json["autoRelease"].bool {
                self.autoRelease = autoRelease
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let autoRelease = self.autoRelease {
                dictionary["autoRelease"] = autoRelease
            }
            
            return dictionary
        }
    }

class PickSource: JSONSerializable {
    var orderLineId: String?
    var stockIds: [String]?

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
    
    if let orderLineId = json["orderLineId"].string {
        self.orderLineId = orderLineId
    }
    
    if let stockIdsArrayValue = json["stockIds"].array {
        self.stockIds = []
        for item in stockIdsArrayValue {
            if var stockIds = stockIds, let itemValue = item.string {
                stockIds.append(itemValue)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orderLineId = self.orderLineId {
        dictionary["orderLineId"] = orderLineId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ORDER_LINE_ID_REQUIRED
    case STOCK_ID_REQUIRED
    case ORDER_LINE_NOT_FOUND
    case STOCK_NOT_FOUND
    case INVALID
    case HEADER_NOT_FOUND
    case NO_PACKAGE_FOUND
    case PICK_SOURCE_REQUIRED
    case INVALID_SOURCE
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreatePick.Code?
    var pickCreateResults: [WsCreatePick.PickCreateResult]?

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
        if let code = WsCreatePick.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let pickCreateResultsArrayValue = json["pickCreateResults"].array {
        self.pickCreateResults = []
        for item in pickCreateResultsArrayValue {
            if let value = WsCreatePick.PickCreateResult(json: item), var pickCreateResults = pickCreateResults {
                pickCreateResults.append(value)
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

enum Result: String {
    case ORDER_LINE_REQUIRED
    case SOURCE_STOCK_ID_REQUIRED
    case ORDER_LINE_NOT_FOUND
    case SOURCE_STOCK_NOT_FOUND
    case NO_OPEN_QUANTITY_ON_ORDER_LINE
    case SOURCE_STOCK_NOT_AVAILABLE
    case ITEMS_NOT_MATCHING
    case ORDER_NOT_FOUND
    case FAILED_TO_GET_MOVEMENT
    case FAILED_TO_GET_SHIPMENT
    case FAILED_TO_GET_PICK_NUMBER
    case SUCCESS
}

class PickCreateResult: JSONSerializable {
    var result: WsCreatePick.Result?
    var orderLineId: String?
    var orderLineNumber: String?
    var sourcedStockId: String?
    var itemVersion: String?
    var itemNumber: String?
    var lotNumber: String?
    var serialNumber: String?
    var pickId: String?
    var pickNumber: String?
    var shipmentId: String?
    var shipmentNumber: String?
    var packageId: String?
    var packageNumber: String?

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
    
    if let resultStringValue = json["result"].string {
        if let result = WsCreatePick.Result(rawValue: resultStringValue) {
            self.result = result
        }
    }
    
    if let orderLineId = json["orderLineId"].string {
        self.orderLineId = orderLineId
    }
    
    if let orderLineNumber = json["orderLineNumber"].string {
        self.orderLineNumber = orderLineNumber
    }
    
    if let sourcedStockId = json["sourcedStockId"].string {
        self.sourcedStockId = sourcedStockId
    }
    
    if let itemVersion = json["itemVersion"].string {
        self.itemVersion = itemVersion
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialNumber = json["serialNumber"].string {
        self.serialNumber = serialNumber
    }
    
    if let pickId = json["pickId"].string {
        self.pickId = pickId
    }
    
    if let pickNumber = json["pickNumber"].string {
        self.pickNumber = pickNumber
    }
    
    if let shipmentId = json["shipmentId"].string {
        self.shipmentId = shipmentId
    }
    
    if let shipmentNumber = json["shipmentNumber"].string {
        self.shipmentNumber = shipmentNumber
    }
    
    if let packageId = json["packageId"].string {
        self.packageId = packageId
    }
    
    if let packageNumber = json["packageNumber"].string {
        self.packageNumber = packageNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let result = self.result {
        dictionary["result"] = result.rawValue
    }
    
    if let orderLineId = self.orderLineId {
        dictionary["orderLineId"] = orderLineId
    }
    
    if let orderLineNumber = self.orderLineNumber {
        dictionary["orderLineNumber"] = orderLineNumber
    }
    
    if let sourcedStockId = self.sourcedStockId {
        dictionary["sourcedStockId"] = sourcedStockId
    }
    
    if let itemVersion = self.itemVersion {
        dictionary["itemVersion"] = itemVersion
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let pickId = self.pickId {
        dictionary["pickId"] = pickId
    }
    
    if let pickNumber = self.pickNumber {
        dictionary["pickNumber"] = pickNumber
    }
    
    if let shipmentId = self.shipmentId {
        dictionary["shipmentId"] = shipmentId
    }
    
    if let shipmentNumber = self.shipmentNumber {
        dictionary["shipmentNumber"] = shipmentNumber
    }
    
    if let packageId = self.packageId {
        dictionary["packageId"] = packageId
    }
    
    if let packageNumber = self.packageNumber {
        dictionary["packageNumber"] = packageNumber
    }
    
    return dictionary
}
}

}
