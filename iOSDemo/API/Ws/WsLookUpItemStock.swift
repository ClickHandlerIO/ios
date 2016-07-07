import Foundation
import SwiftyJSON

struct WsLookUpItemStock {

    class Request: WsRequest {
        typealias Response = WsLookUpItemStock.Response
        
        var locationId: String?
        var itemNumber: String?
        var lotOrSerialNumber: String?
        var itemId: String?
        var lotId: String?
        var serialId: String?
        
        class func getPath() -> String {
            return "/inventory/stock/lookupitemstock"
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
            
            if let locationId = json["locationId"].string {
                self.locationId = locationId
            }
            
            if let itemNumber = json["itemNumber"].string {
                self.itemNumber = itemNumber
            }
            
            if let lotOrSerialNumber = json["lotOrSerialNumber"].string {
                self.lotOrSerialNumber = lotOrSerialNumber
            }
            
            if let itemId = json["itemId"].string {
                self.itemId = itemId
            }
            
            if let lotId = json["lotId"].string {
                self.lotId = lotId
            }
            
            if let serialId = json["serialId"].string {
                self.serialId = serialId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            if let itemNumber = self.itemNumber {
                dictionary["itemNumber"] = itemNumber
            }
            
            if let lotOrSerialNumber = self.lotOrSerialNumber {
                dictionary["lotOrSerialNumber"] = lotOrSerialNumber
            }
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            if let lotId = self.lotId {
                dictionary["lotId"] = lotId
            }
            
            if let serialId = self.serialId {
                dictionary["serialId"] = serialId
            }
            
            return dictionary
        }
    }

class ItemStock: JSONSerializable {
    var stockEntity: StockEntity?
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
    
    self.stockEntity = StockEntity(json: json["stockEntity"])
    
    self.container = Container(json: json["container"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let stockEntity = self.stockEntity {
        dictionary["stockEntity"] = stockEntity.asDictionary()
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case STOCK_ID_REQUIRED
    case NOT_FOUND
    case INVALID_REQUEST
    case KIT_TRAY_NOT_FOUND
    case LOCATION_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsLookUpItemStock.Code?
    var itemStock: [WsLookUpItemStock.ItemStock]?

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
        if let code = WsLookUpItemStock.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let itemStockArrayValue = json["itemStock"].array {
        self.itemStock = []
        for item in itemStockArrayValue {
            if let value = WsLookUpItemStock.ItemStock(json: item), var itemStock = itemStock {
                itemStock.append(value)
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
