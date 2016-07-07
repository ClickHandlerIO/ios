import Foundation
import SwiftyJSON

struct WsListKitTrayStock {

    class Request: WsRequest {
        typealias Response = WsListKitTrayStock.Response
        
        var kitTrayNumber: String?
        var serialNumber: String?
        var itemId: String?
        var serialId: String?
        
        class func getPath() -> String {
            return "/inventory/stock/listkittraystock"
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
            
            if let kitTrayNumber = json["kitTrayNumber"].string {
                self.kitTrayNumber = kitTrayNumber
            }
            
            if let serialNumber = json["serialNumber"].string {
                self.serialNumber = serialNumber
            }
            
            if let itemId = json["itemId"].string {
                self.itemId = itemId
            }
            
            if let serialId = json["serialId"].string {
                self.serialId = serialId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let kitTrayNumber = self.kitTrayNumber {
                dictionary["kitTrayNumber"] = kitTrayNumber
            }
            
            if let serialNumber = self.serialNumber {
                dictionary["serialNumber"] = serialNumber
            }
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            if let serialId = self.serialId {
                dictionary["serialId"] = serialId
            }
            
            return dictionary
        }
    }

class KitTrayStock: JSONSerializable {
    var stockEntity: StockEntity?
    var itemEntity: ItemEntity?
    var itemVersionEntity: ItemVersionEntity?
    var lotEntity: LotEntity?
    var serialEntity: SerialEntity?

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
    
    self.itemEntity = ItemEntity(json: json["itemEntity"])
    
    self.itemVersionEntity = ItemVersionEntity(json: json["itemVersionEntity"])
    
    self.lotEntity = LotEntity(json: json["lotEntity"])
    
    self.serialEntity = SerialEntity(json: json["serialEntity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let stockEntity = self.stockEntity {
        dictionary["stockEntity"] = stockEntity.asDictionary()
    }
    
    if let itemEntity = self.itemEntity {
        dictionary["itemEntity"] = itemEntity.asDictionary()
    }
    
    if let itemVersionEntity = self.itemVersionEntity {
        dictionary["itemVersionEntity"] = itemVersionEntity.asDictionary()
    }
    
    if let lotEntity = self.lotEntity {
        dictionary["lotEntity"] = lotEntity.asDictionary()
    }
    
    if let serialEntity = self.serialEntity {
        dictionary["serialEntity"] = serialEntity.asDictionary()
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListKitTrayStock.Code?
    var kitTrayStock: [WsListKitTrayStock.KitTrayStock]?

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
        if let code = WsListKitTrayStock.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let kitTrayStockArrayValue = json["kitTrayStock"].array {
        self.kitTrayStock = []
        for item in kitTrayStockArrayValue {
            if let value = WsListKitTrayStock.KitTrayStock(json: item), var kitTrayStock = kitTrayStock {
                kitTrayStock.append(value)
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
    case STOCK_ID_REQUIRED
    case NOT_FOUND
    case INVALID_REQUEST
    case KIT_TRAY_NOT_FOUND
    case FAILED
}

}
