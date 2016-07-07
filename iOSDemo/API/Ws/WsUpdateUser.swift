import Foundation
import SwiftyJSON

struct WsUpdateUser {

    class Request: WsRequest {
        typealias Response = WsUpdateUser.Response
        
        var id: String?
        var username: String?
        var password: String?
        var timeZone: TZ?
        var status: UserStatus?
        
        class func getPath() -> String {
            return "/dir/user/update"
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
            
            if let username = json["username"].string {
                self.username = username
            }
            
            if let password = json["password"].string {
                self.password = password
            }
            
            if let timeZoneStringValue = json["timeZone"].string {
                if let timeZone = TZ(rawValue: timeZoneStringValue) {
                    self.timeZone = timeZone
                }
            }
            
            if let statusStringValue = json["status"].string {
                if let status = UserStatus(rawValue: statusStringValue) {
                    self.status = status
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let username = self.username {
                dictionary["username"] = username
            }
            
            if let password = self.password {
                dictionary["password"] = password
            }
            
            if let timeZone = self.timeZone {
                dictionary["timeZone"] = timeZone.rawValue
            }
            
            if let status = self.status {
                dictionary["status"] = status.rawValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case EMPTY_USERNAME
    case EMPTY_TIMEZONE
    case EMPTY_AVAILABLE_PERSPECTIVE
    case EMPTY_STATUS
    case GET_FAILED
    case NOT_FOUND
    case UPDATE_FAILED
    case USERNAME_ALREADY_IN_USE
    case PASSWORD_REQUIRED
    case INVALID_PASSWORD
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUpdateUser.Code?
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
        if let code = WsUpdateUser.Code(rawValue: codeStringValue) {
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
