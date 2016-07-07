import Foundation
import SwiftyJSON

struct WsAcceptLostFoundStock {

    class Request: WsRequest {
        typealias Response = WsAcceptLostFoundStock.Response
        
        var stockIds: [String]?
        
        class func getPath() -> String {
            return "/inventory/stock/lostfound/acceptlostfound"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsAcceptLostFoundStock.Code?

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
        if let code = WsAcceptLostFoundStock.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case STOCK_ID_REQUIRED
    case NOT_LOST_OR_FOUND
    case NOT_FOUND
    case FAILED
}

}
