import Foundation
import SwiftyJSON

struct WsSaveSystemAdmin {

    class Request: WsRequest {
        typealias Response = WsSaveSystemAdmin.Response
        
        var id: String?
        var name: PersonName?
        var email: Email?
        var timeZone: TZ?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/systemadmin/save"
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
    case FAILED
    case EMPTY_EMAIL
    case NOT_FOUND
    case EMAIL_ALREADY_IN_USE
    case TIME_ZONE_REQUIRED
    case EMPTY_NAME
}

class Response: JSONSerializable {
    var code: WsSaveSystemAdmin.Code?
    var systemAdminId: String?
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
        if let code = WsSaveSystemAdmin.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let systemAdminId = json["systemAdminId"].string {
        self.systemAdminId = systemAdminId
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
    
    if let systemAdminId = self.systemAdminId {
        dictionary["systemAdminId"] = systemAdminId
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
