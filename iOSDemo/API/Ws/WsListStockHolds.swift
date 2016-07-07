import Foundation
import SwiftyJSON

struct WsListStockHolds {

    class Request: WsRequest {
        typealias Response = WsListStockHolds.Response
        
        var stockId: String?
        var search: String?
        
        class func getPath() -> String {
            return "/inventory/stock/hold/liststockholds"
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
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let stockId = self.stockId {
                dictionary["stockId"] = stockId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Hold: JSONSerializable {
    var id: String?
    var holdReasonName: String?
    var userDisplayName: String?
    var created: Int?

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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let holdReasonName = json["holdReasonName"].string {
        self.holdReasonName = holdReasonName
    }
    
    if let userDisplayName = json["userDisplayName"].string {
        self.userDisplayName = userDisplayName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let holdReasonName = self.holdReasonName {
        dictionary["holdReasonName"] = holdReasonName
    }
    
    if let userDisplayName = self.userDisplayName {
        dictionary["userDisplayName"] = userDisplayName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListStockHolds.Code?
    var holds: [WsListStockHolds.Hold]?

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
        if let code = WsListStockHolds.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let holdsArrayValue = json["holds"].array {
        self.holds = []
        for item in holdsArrayValue {
            if let value = WsListStockHolds.Hold(json: item), var holds = holds {
                holds.append(value)
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
    case FAILED
}

}
