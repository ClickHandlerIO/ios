import Foundation
import SwiftyJSON

struct WsVerifyKit {

    class Request: WsRequest {
        typealias Response = WsVerifyKit.Response
        
        var kitStockId: String?
        var stockIds: [String]?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/kit/verifykit"
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
            
            if let kitStockId = self.kitStockId {
                dictionary["kitStockId"] = kitStockId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case KIT_STOCK_ID_REQUIRED
    case STOCK_REQUIRED
    case IMPROPER_PACKAGE_STATE
    case STOCK_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsVerifyKit.Code?

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
        if let code = WsVerifyKit.Code(rawValue: codeStringValue) {
            self.code = code
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
