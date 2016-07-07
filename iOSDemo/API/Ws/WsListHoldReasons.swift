import Foundation
import SwiftyJSON

struct WsListHoldReasons {

    class Request: WsRequest {
        typealias Response = WsListHoldReasons.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/inventory/stock/hold/listholdreasons"
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
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListHoldReasons.Code?
    var holdReasons: [HoldReasonEntity]?

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
        if let code = WsListHoldReasons.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let holdReasonsArrayValue = json["holdReasons"].array {
        self.holdReasons = []
        for item in holdReasonsArrayValue {
            if let value = HoldReasonEntity(json: item), var holdReasons = holdReasons {
                holdReasons.append(value)
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
    case CONTEXT_REQUIRED
    case FAILED
}

}
