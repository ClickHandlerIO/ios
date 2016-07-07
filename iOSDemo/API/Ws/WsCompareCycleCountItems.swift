import Foundation
import SwiftyJSON

struct WsCompareCycleCountItems {

    class Request: WsRequest {
        typealias Response = WsCompareCycleCountItems.Response
        
        var cycleCountId: String?
        var comparisonScope: WsCompareCycleCountItems.ComparisonScope?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/comparecyclecountitems"
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
            
            if let comparisonScopeStringValue = json["comparisonScope"].string {
                if let comparisonScope = WsCompareCycleCountItems.ComparisonScope(rawValue: comparisonScopeStringValue) {
                    self.comparisonScope = comparisonScope
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let cycleCountId = self.cycleCountId {
                dictionary["cycleCountId"] = cycleCountId
            }
            
            if let comparisonScope = self.comparisonScope {
                dictionary["comparisonScope"] = comparisonScope.rawValue
            }
            
            return dictionary
        }
    }

enum ComparisonScope: String {
    case ITEM
    case CONTAINERS
    case LOCATION
}

enum Code: String {
    case SUCCESS
    case CYCLE_COUNT_ID_REQUIRED
    case CYCLE_COUNT_NOT_FOUND
    case COMPARISON_SCOPE_REQUIRED
    case INVALID_COMP_SCOPE
    case INVALID_CYCLE_STATUS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCompareCycleCountItems.Code?

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
        if let code = WsCompareCycleCountItems.Code(rawValue: codeStringValue) {
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
