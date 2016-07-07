import Foundation
import SwiftyJSON

struct WsSaveConsumer {

    class Request: WsRequest {
        typealias Response = WsSaveConsumer.Response
        
        var id: String?
        var name: PersonName?
        var email: Email?
        var timeZone: TZ?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/consumer/save"
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
    case NAME_REQUIRED
    case EMPTY_EMAIL
    case TIME_ZONE_REQUIRED
    case EMAIL_ALREADY_IN_USE
    case ORG_NOT_FOUND
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveConsumer.Code?
    var consumerId: String?
    var userId: String?

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
        if let code = WsSaveConsumer.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let consumerId = json["consumerId"].string {
        self.consumerId = consumerId
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let consumerId = self.consumerId {
        dictionary["consumerId"] = consumerId
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    return dictionary
}
}

}
