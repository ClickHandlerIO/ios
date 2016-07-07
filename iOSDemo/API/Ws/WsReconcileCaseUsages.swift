import Foundation
import SwiftyJSON

struct WsReconcileCaseUsages {

    class Request: WsRequest {
        typealias Response = WsReconcileCaseUsages.Response
        
        var caseEventId: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/reconcilecaseusages"
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
            
            if let caseEventId = json["caseEventId"].string {
                self.caseEventId = caseEventId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case USAGES_NOT_FOUND
    case USAGE_STOCK_NOT_SET
    case REPLEN_PREP_FAILED
    case SALES_PREP_FAILED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsReconcileCaseUsages.Code?

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
        if let code = WsReconcileCaseUsages.Code(rawValue: codeStringValue) {
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
