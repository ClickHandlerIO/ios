import Foundation
import SwiftyJSON

struct WsCreateStock {

    class Request: WsRequest {
        typealias Response = WsCreateStock.Response
        
        var stockEntry: StockEntry?
        
        class func getPath() -> String {
            return "/inventory/stock/createstock"
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
            
            self.stockEntry = StockEntry(json: json["stockEntry"])
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let stockEntry = self.stockEntry {
                dictionary["stockEntry"] = stockEntry.asDictionary()
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case ENTRY_REQUIRED
    case INVALID_ENTRY
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreateStock.Code?
    var numStockCreated: Int?

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
        if let code = WsCreateStock.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let numStockCreated = json["numStockCreated"].int {
        self.numStockCreated = numStockCreated
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let numStockCreated = self.numStockCreated {
        dictionary["numStockCreated"] = numStockCreated
    }
    
    return dictionary
}
}

}
