import Foundation
import SwiftyJSON

struct WsAddAeToTeam {

    class Request: WsRequest {
        typealias Response = WsAddAeToTeam.Response
        
        var aeId: String?
        var teamIds: [String]?
        
        class func getPath() -> String {
            return "/dir/aetoteam/add"
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
            
            if let aeId = json["aeId"].string {
                self.aeId = aeId
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
            
            if let aeId = self.aeId {
                dictionary["aeId"] = aeId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsAddAeToTeam.Code?
    var entity: AeToTeamEntity?

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
        if let code = WsAddAeToTeam.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.entity = AeToTeamEntity(json: json["entity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let entity = self.entity {
        dictionary["entity"] = entity.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
    case INVALID_AE_ID
    case EXISTING_CHECK_FAILED
    case ALREADY_EXISTS
    case TEAM_ID_REQUIRED
    case CREATE_FAILED
}

}
