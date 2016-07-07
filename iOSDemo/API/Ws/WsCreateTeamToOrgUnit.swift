import Foundation
import SwiftyJSON

struct WsCreateTeamToOrgUnit {

    class Request: WsRequest {
        typealias Response = WsCreateTeamToOrgUnit.Response
        
        var orgUnitIds: [String]?
        var teamIds: [String]?
        
        class func getPath() -> String {
            return "/dir/teamtoorgunit/create"
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
            
            if let orgUnitIdsArrayValue = json["orgUnitIds"].array {
                self.orgUnitIds = []
                for item in orgUnitIdsArrayValue {
                    if var orgUnitIds = orgUnitIds, let itemValue = item.string {
                        orgUnitIds.append(itemValue)
                    }
                }
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
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateTeamToOrgUnit.Code?

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
        if let code = WsCreateTeamToOrgUnit.Code(rawValue: codeStringValue) {
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
    case ORG_UNIT_AND_TEAM_ID_REQUIRED
    case INVALID_REQUEST
    case FAILED
}

}
