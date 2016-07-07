import Foundation
import SwiftyJSON

struct WsSaveBizUnit {

    class Request: WsRequest {
        typealias Response = WsSaveBizUnit.Response
        
        var id: String?
        var name: String?
        var orgId: String?
        var orgType: OrgType?
        var description: String?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/bizunit/save"
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
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let orgId = json["orgId"].string {
                self.orgId = orgId
            }
            
            if let orgTypeStringValue = json["orgType"].string {
                if let orgType = OrgType(rawValue: orgTypeStringValue) {
                    self.orgType = orgType
                }
            }
            
            if let description = json["description"].string {
                self.description = description
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
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let orgId = self.orgId {
                dictionary["orgId"] = orgId
            }
            
            if let orgType = self.orgType {
                dictionary["orgType"] = orgType.rawValue
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ORG_ID
    case ORG_TYPE_REQUIRED
    case NAME_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveBizUnit.Code?
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
        if let code = WsSaveBizUnit.Code(rawValue: codeStringValue) {
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
