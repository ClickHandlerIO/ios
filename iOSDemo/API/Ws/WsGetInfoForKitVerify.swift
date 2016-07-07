import Foundation
import SwiftyJSON

struct WsGetInfoForKitVerify {

    class Request: WsRequest {
        typealias Response = WsGetInfoForKitVerify.Response
        
        var kitStockId: String?
        var kitNumber: String?
        var serialNumber: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/kit/getinfoforkitverify"
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
            
            if let kitStockId = json["kitStockId"].string {
                self.kitStockId = kitStockId
            }
            
            if let kitNumber = json["kitNumber"].string {
                self.kitNumber = kitNumber
            }
            
            if let serialNumber = json["serialNumber"].string {
                self.serialNumber = serialNumber
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let kitStockId = self.kitStockId {
                dictionary["kitStockId"] = kitStockId
            }
            
            if let kitNumber = self.kitNumber {
                dictionary["kitNumber"] = kitNumber
            }
            
            if let serialNumber = self.serialNumber {
                dictionary["serialNumber"] = serialNumber
            }
            
            return dictionary
        }
    }

class KitStock: JSONSerializable {
    var stockEntity: StockEntity?
    var itemId: String?
    var kitStandard: Bool?

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
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let kitStandard = json["kitStandard"].bool {
        self.kitStandard = kitStandard
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let stockEntity = self.stockEntity {
        dictionary["stockEntity"] = stockEntity.asDictionary()
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let kitStandard = self.kitStandard {
        dictionary["kitStandard"] = kitStandard
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case KIT_STOCK_ID_REQUIRED
    case FAILED
    case SHIPMENT_NOT_FOUND
    case ORDER_NOT_FOUND
    case LOAN_NOT_FOUND
    case STATE_CHANGE_FAILED
    case INVALID_REQUEST
    case KIT_NOT_FOUND
    case NOT_IMPLEMENTED
}

class Response: JSONSerializable {
    var code: WsGetInfoForKitVerify.Code?
    var kitStockList: [WsGetInfoForKitVerify.KitStock]?
    var items: [WsGetInfoForKitVerify.Item]?
    var barcodes: [BarcodeEntity]?
    var lots: [LotEntity]?
    var serials: [SerialEntity]?

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
        if let code = WsGetInfoForKitVerify.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let kitStockListArrayValue = json["kitStockList"].array {
        self.kitStockList = []
        for item in kitStockListArrayValue {
            if let value = WsGetInfoForKitVerify.KitStock(json: item), var kitStockList = kitStockList {
                kitStockList.append(value)
            }
        }
    }
    
    if let itemsArrayValue = json["items"].array {
        self.items = []
        for item in itemsArrayValue {
            if let value = WsGetInfoForKitVerify.Item(json: item), var items = items {
                items.append(value)
            }
        }
    }
    
    if let barcodesArrayValue = json["barcodes"].array {
        self.barcodes = []
        for item in barcodesArrayValue {
            if let value = BarcodeEntity(json: item), var barcodes = barcodes {
                barcodes.append(value)
            }
        }
    }
    
    if let lotsArrayValue = json["lots"].array {
        self.lots = []
        for item in lotsArrayValue {
            if let value = LotEntity(json: item), var lots = lots {
                lots.append(value)
            }
        }
    }
    
    if let serialsArrayValue = json["serials"].array {
        self.serials = []
        for item in serialsArrayValue {
            if let value = SerialEntity(json: item), var serials = serials {
                serials.append(value)
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

class Item: JSONSerializable {
    var itemId: String?
    var itemVersionId: String?
    var itemNumber: String?
    var itemDescription: String?

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
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemDescription = json["itemDescription"].string {
        self.itemDescription = itemDescription
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemDescription = self.itemDescription {
        dictionary["itemDescription"] = itemDescription
    }
    
    return dictionary
}
}

}
