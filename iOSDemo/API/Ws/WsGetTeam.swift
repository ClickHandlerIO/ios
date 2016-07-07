import Foundation
import SwiftyJSON

struct WsGetTeam {

    class Request: WsRequest {
        typealias Response = WsGetTeam.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/team/get"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case GET_FAILED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsGetTeam.Code?
    var detail: WsGetTeam.TeamDetail?

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
        if let code = WsGetTeam.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetTeam.TeamDetail(json: json["detail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let detail = self.detail {
        dictionary["detail"] = detail.asDictionary()
    }
    
    return dictionary
}
}

class TeamDetail: JSONSerializable {
    var id: String?
    var orgId: String?
    var orgName: String?
    var orgType: OrgType?
    var salesTeam: Bool?
    var opsTeam: Bool?
    var name: String?
    var active: Bool?

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
    
    if let orgName = json["orgName"].string {
        self.orgName = orgName
    }
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let salesTeam = json["salesTeam"].bool {
        self.salesTeam = salesTeam
    }
    
    if let opsTeam = json["opsTeam"].bool {
        self.opsTeam = opsTeam
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
    
    if let orgName = self.orgName {
        dictionary["orgName"] = orgName
    }
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let salesTeam = self.salesTeam {
        dictionary["salesTeam"] = salesTeam
    }
    
    if let opsTeam = self.opsTeam {
        dictionary["opsTeam"] = opsTeam
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

}
