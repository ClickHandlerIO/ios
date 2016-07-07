import Foundation
import SwiftyJSON

struct WsSaveDce {

    class Request: WsRequest {
        typealias Response = WsSaveDce.Response
        
        var id: String?
        var orgId: String?
        var workingAtId: String?
        var workingHomeId: String?
        var name: PersonName?
        var email: Email?
        var timeZone: TZ?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/dce/save"
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
            
            if let workingAtId = json["workingAtId"].string {
                self.workingAtId = workingAtId
            }
            
            if let workingHomeId = json["workingHomeId"].string {
                self.workingHomeId = workingHomeId
            }
            
            self.name = PersonName(json: json["name"])
            
            self.email = Email(json: json["email"])
            
            if let timeZoneStringValue = json["timeZone"].string {
                if let timeZone = TZ(rawValue: timeZoneStringValue) {
                    self.timeZone = timeZone
                }
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
            
            if let workingAtId = self.workingAtId {
                dictionary["workingAtId"] = workingAtId
            }
            
            if let workingHomeId = self.workingHomeId {
                dictionary["workingHomeId"] = workingHomeId
            }
            
            if let name = self.name {
                dictionary["name"] = name.asDictionary()
            }
            
            if let email = self.email {
                dictionary["email"] = email.asDictionary()
            }
            
            if let timeZone = self.timeZone {
                dictionary["timeZone"] = timeZone.rawValue
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
    case EMPTY_NAME
    case EMPTY_EMAIL
    case TIME_ZONE_REQUIRED
    case EMAIL_ALREADY_IN_USE
    case ORG_NOT_FOUND
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveDce.Code?
    var dceId: String?
    var userId: String?
    var contactId: String?

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
        if let code = WsSaveDce.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let dceId = json["dceId"].string {
        self.dceId = dceId
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    if let contactId = json["contactId"].string {
        self.contactId = contactId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let dceId = self.dceId {
        dictionary["dceId"] = dceId
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let contactId = self.contactId {
        dictionary["contactId"] = contactId
    }
    
    return dictionary
}
}

}
