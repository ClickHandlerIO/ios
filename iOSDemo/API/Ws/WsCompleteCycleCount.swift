import Foundation
import SwiftyJSON

struct WsCompleteCycleCount {

    class Request: WsRequest {
        typealias Response = WsCompleteCycleCount.Response
        
        var cycleCountId: String?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/completecyclecount"
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
            
            if let cycleCountId = json["cycleCountId"].string {
                self.cycleCountId = cycleCountId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let cycleCountId = self.cycleCountId {
                dictionary["cycleCountId"] = cycleCountId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCompleteCycleCount.Code?

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
        if let code = WsCompleteCycleCount.Code(rawValue: codeStringValue) {
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
    case CYCLE_COUNT_ID_REQUIRED
    case CYCLE_COUNT_NOT_FOUND
    case INVALID_CYCLE_STATUS
    case ITEMS_NOT_FOUND
    case FAILED
}

}
