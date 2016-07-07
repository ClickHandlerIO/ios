import Foundation
import SwiftyJSON

struct WsAddHcrToTeam {

    class Request: WsRequest {
        typealias Response = WsAddHcrToTeam.Response
        
        var hcrId: String?
        var teamIds: [String]?
        
        class func getPath() -> String {
            return "/dir/hcrtoteam/add"
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
            
            if let teamIdsArrayValue = json["teamIds"].array {
                self.teamIds = []
                for item in teamIdsArrayValue {
                    if var teamIds = teamIds, let itemValue = item.string {
                        teamIds.append(itemValue)
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

enum Code: String {
    case SUCCESS
    case INVALID_HCR_ID
    case TEAM_ID_REQUIRED
    case ALREADY_EXISTS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsAddHcrToTeam.Code?

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
        if let code = WsAddHcrToTeam.Code(rawValue: codeStringValue) {
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
