import Foundation
import SwiftyJSON

struct WsUnholdStock {

    class Request: WsRequest {
        typealias Response = WsUnholdStock.Response
        
        var stockId: String?
        var holdReasonId: String?
        var all: Bool?
        
        class func getPath() -> String {
            return "/inventory/stock/hold/unholdstock"
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
            
            if let stockId = json["stockId"].string {
                self.stockId = stockId
            }
            
            if let holdReasonId = json["holdReasonId"].string {
                self.holdReasonId = holdReasonId
            }
            
            if let all = json["all"].bool {
                self.all = all
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let stockId = self.stockId {
                dictionary["stockId"] = stockId
            }
            
            if let holdReasonId = self.holdReasonId {
                dictionary["holdReasonId"] = holdReasonId
            }
            
            if let all = self.all {
                dictionary["all"] = all
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case STOCK_REQUIRED
    case REASON_REQUIRED
    case HOLD_REASON_NOT_FOUND
    case CONTEXT_REQUIRED
    case HOLD_NOT_FOUND
    case STOCK_NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUnholdStock.Code?

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
        if let code = WsUnholdStock.Code(rawValue: codeStringValue) {
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
