import Foundation
import SwiftyJSON

struct WsListPossibleUsageStock {

    class Request: WsRequest {
        typealias Response = WsListPossibleUsageStock.Response
        
        var usageId: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/listpossibleusagestock"
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
            
            if let usageId = json["usageId"].string {
                self.usageId = usageId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let usageId = self.usageId {
                dictionary["usageId"] = usageId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListPossibleUsageStock.Code?
    var possibleStock: [WsListPossibleUsageStock.LocationStock]?

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
        if let code = WsListPossibleUsageStock.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let possibleStockArrayValue = json["possibleStock"].array {
        self.possibleStock = []
        for item in possibleStockArrayValue {
            if let value = WsListPossibleUsageStock.LocationStock(json: item), var possibleStock = possibleStock {
                possibleStock.append(value)
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

class LocationContainer: JSONSerializable {
    var location: Location?
    var rootContainer: Container?
    var container: Container?

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
    
    self.location = Location(json: json["location"])
    
    self.rootContainer = Container(json: json["rootContainer"])
    
    self.container = Container(json: json["container"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    if let rootContainer = self.rootContainer {
        dictionary["rootContainer"] = rootContainer.asDictionary()
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case USAGE_ID_REQUIRED
    case NOT_FOUND
    case CASE_NOT_FOUND
    case FAILED
}

class LocationStock: JSONSerializable {
    var stockId: String?
    var lotId: String?
    var lotNumber: String?
    var serialId: String?
    var serialNumber: String?
    var inventoryTypeId: String?
    var inventoryTypeName: String?
    var locationContainer: WsListPossibleUsageStock.LocationContainer?

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
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
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
    
    if let serialNumber = json["serialNumber"].string {
        self.serialNumber = serialNumber
    }
    
    if let inventoryTypeId = json["inventoryTypeId"].string {
        self.inventoryTypeId = inventoryTypeId
    }
    
    if let inventoryTypeName = json["inventoryTypeName"].string {
        self.inventoryTypeName = inventoryTypeName
    }
    
    self.locationContainer = WsListPossibleUsageStock.LocationContainer(json: json["locationContainer"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
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
    
    if let inventoryTypeId = self.inventoryTypeId {
        dictionary["inventoryTypeId"] = inventoryTypeId
    }
    
    if let inventoryTypeName = self.inventoryTypeName {
        dictionary["inventoryTypeName"] = inventoryTypeName
    }
    
    if let locationContainer = self.locationContainer {
        dictionary["locationContainer"] = locationContainer.asDictionary()
    }
    
    return dictionary
}
}

}
