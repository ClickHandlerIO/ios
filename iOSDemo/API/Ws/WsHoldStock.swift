import Foundation
import SwiftyJSON

struct WsHoldStock {

    class Request: WsRequest {
        typealias Response = WsHoldStock.Response
        
        var stockIds: [String]?
        var holdReasonId: String?
        
        class func getPath() -> String {
            return "/inventory/stock/hold/holdstock"
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
            
            if let stockIdsArrayValue = json["stockIds"].array {
                self.stockIds = []
                for item in stockIdsArrayValue {
                    if var stockIds = stockIds, let itemValue = item.string {
                        stockIds.append(itemValue)
                    }
                }
            }
            
            if let holdReasonId = json["holdReasonId"].string {
                self.holdReasonId = holdReasonId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let holdReasonId = self.holdReasonId {
                dictionary["holdReasonId"] = holdReasonId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case STOCK_REQUIRED
    case REASON_REQUIRED
    case INVALID_STOCK_ID
    case HOLD_REASON_NOT_FOUND
    case CONTEXT_REQUIRED
    case DUPLICATE_HOLD
    case FAILED
}

class Response: JSONSerializable {
    var code: WsHoldStock.Code?

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
        if let code = WsHoldStock.Code(rawValue: codeStringValue) {
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
