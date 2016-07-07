import Foundation
import SwiftyJSON

struct WsSaveTeam {

    class Request: WsRequest {
        typealias Response = WsSaveTeam.Response
        
        var id: String?
        var orgId: String?
        var orgType: OrgType?
        var opsTeam: Bool?
        var salesTeam: Bool?
        var name: String?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/team/save"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let orgId = json["orgId"].string {
                self.orgId = orgId
            }
            
            if let orgTypeStringValue = json["orgType"].string {
                if let orgType = OrgType(rawValue: orgTypeStringValue) {
                    self.orgType = orgType
                }
            }
            
            if let opsTeam = json["opsTeam"].bool {
                self.opsTeam = opsTeam
            }
            
            if let salesTeam = json["salesTeam"].bool {
                self.salesTeam = salesTeam
            }
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let active = json["active"].bool {
                self.active = active
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let orgId = self.orgId {
                dictionary["orgId"] = orgId
            }
            
            if let orgType = self.orgType {
                dictionary["orgType"] = orgType.rawValue
            }
            
            if let opsTeam = self.opsTeam {
                dictionary["opsTeam"] = opsTeam
            }
            
            if let salesTeam = self.salesTeam {
                dictionary["salesTeam"] = salesTeam
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case EMPTY_NAME
    case NOT_FOUND
    case INVALID_ORG_ID
    case EMPTY_ORG_TYPE
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveTeam.Code?
    var id: String?

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
        if let code = WsSaveTeam.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    return dictionary
}
}

}
