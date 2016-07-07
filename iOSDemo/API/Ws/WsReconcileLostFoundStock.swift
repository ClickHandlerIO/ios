import Foundation
import SwiftyJSON

struct WsReconcileLostFoundStock {

    class Request: WsRequest {
        typealias Response = WsReconcileLostFoundStock.Response
        
        var stockMatches: [WsReconcileLostFoundStock.StockMatchLite]?
        
        class func getPath() -> String {
            return "/inventory/stock/lostfound/reclostfound"
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
            
            if let stockMatchesArrayValue = json["stockMatches"].array {
                self.stockMatches = []
                for item in stockMatchesArrayValue {
                    if let value = WsReconcileLostFoundStock.StockMatchLite(json: item), var stockMatches = stockMatches {
                        stockMatches.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

class StockMatchLite: JSONSerializable {
    var lostId: String?
    var foundId: String?

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
    
    if let lostId = json["lostId"].string {
        self.lostId = lostId
    }
    
    if let foundId = json["foundId"].string {
        self.foundId = foundId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let lostId = self.lostId {
        dictionary["lostId"] = lostId
    }
    
    if let foundId = self.foundId {
        dictionary["foundId"] = foundId
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsReconcileLostFoundStock.Code?

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
        if let code = WsReconcileLostFoundStock.Code(rawValue: codeStringValue) {
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
    case CONTEXT_REQUIRED
    case STOCK_MATCH_REQUIRED
    case INVALID_MATCH_OBJECT
    case STOCK_NOT_FOUND
    case INVALID_STOCK_OBJECT
    case INVALID_STOCK_STATUS
    case MISMATCH
    case DUPLICATE_STOCK_ID
    case FAILED
}

}
