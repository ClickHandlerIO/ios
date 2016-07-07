import Foundation
import SwiftyJSON

struct WsAssignPick {

    class Request: WsRequest {
        typealias Response = WsAssignPick.Response
        
        var pickIds: [String]?
        var userId: String?
        
        class func getPath() -> String {
            return "/inventory/pick/assignpick"
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
            
            if let pickIdsArrayValue = json["pickIds"].array {
                self.pickIds = []
                for item in pickIdsArrayValue {
                    if var pickIds = pickIds, let itemValue = item.string {
                        pickIds.append(itemValue)
                    }
                }
            }
            
            if let userId = json["userId"].string {
                self.userId = userId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let userId = self.userId {
                dictionary["userId"] = userId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case PICK_ID_REQUIRED
    case USER_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsAssignPick.Code?

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
        if let code = WsAssignPick.Code(rawValue: codeStringValue) {
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
