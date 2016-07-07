import Foundation
import SwiftyJSON

struct WsAddHcrToColleague {

    class Request: WsRequest {
        typealias Response = WsAddHcrToColleague.Response
        
        var hcrId: String?
        var colleagueIds: [String]?
        
        class func getPath() -> String {
            return "/dir/relationship/hcrtocolleague/add"
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
            
            if let hcrId = json["hcrId"].string {
                self.hcrId = hcrId
            }
            
            if let colleagueIdsArrayValue = json["colleagueIds"].array {
                self.colleagueIds = []
                for item in colleagueIdsArrayValue {
                    if var colleagueIds = colleagueIds, let itemValue = item.string {
                        colleagueIds.append(itemValue)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let hcrId = self.hcrId {
                dictionary["hcrId"] = hcrId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsAddHcrToColleague.Code?

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
        if let code = WsAddHcrToColleague.Code(rawValue: codeStringValue) {
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
    case NOT_FOUND
    case HCR_ID_REQUIRED
    case COLLEAGUE_ID_REQUIRED
    case HCR_NOT_FOUND
    case ORG_UNIT_NOT_FOUND
    case INVALID
    case ALREADY_EXISTS
    case FAILED
}

}
