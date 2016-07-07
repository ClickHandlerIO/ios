import Foundation
import SwiftyJSON

struct WsListStockForAdHocTransfer {

    class Request: WsRequest {
        typealias Response = WsListStockForAdHocTransfer.Response
        
        var itemId: String?
        var lotId: String?
        var serialId: String?
        
        class func getPath() -> String {
            return "/inventory/stock/liststockforadhoctransfer"
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

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListStockForAdHocTransfer.Code?
    var stockItems: [StockItem]?

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
        if let code = WsListStockForAdHocTransfer.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let stockItemsArrayValue = json["stockItems"].array {
        self.stockItems = []
        for item in stockItemsArrayValue {
            if let value = StockItem(json: item), var stockItems = stockItems {
                stockItems.append(value)
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
