import Foundation
import SwiftyJSON

struct WsLogin {

    class Request: WsRequest {
        typealias Response = WsLogin.Response
        
        var email: String?
        var password: String?
        var deviceType: DeviceType?
        var deviceId: String?
        var userAgent: String?
        var sessionId: String?
        
        class func getPath() -> String {
            return "/auth/login"
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
            
            if let email = json["email"].string {
                self.email = email
            }
            
            if let password = json["password"].string {
                self.password = password
            }
            
            if let deviceTypeStringValue = json["deviceType"].string {
                if let deviceType = DeviceType(rawValue: deviceTypeStringValue) {
                    self.deviceType = deviceType
                }
            }
            
            if let deviceId = json["deviceId"].string {
                self.deviceId = deviceId
            }
            
            if let userAgent = json["userAgent"].string {
                self.userAgent = userAgent
            }
            
            if let sessionId = json["sessionId"].string {
                self.sessionId = sessionId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let email = self.email {
                dictionary["email"] = email
            }
            
            if let password = self.password {
                dictionary["password"] = password
            }
            
            if let deviceType = self.deviceType {
                dictionary["deviceType"] = deviceType.rawValue
            }
            
            if let deviceId = self.deviceId {
                dictionary["deviceId"] = deviceId
            }
            
            if let userAgent = self.userAgent {
                dictionary["userAgent"] = userAgent
            }
            
            if let sessionId = self.sessionId {
                dictionary["sessionId"] = sessionId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsLogin.Code?
    var sessionId: String?
    var user: User?
    var logLevel: String?

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
        if let code = WsLogin.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let sessionId = json["sessionId"].string {
        self.sessionId = sessionId
    }
    
    self.user = User(json: json["user"])
    
    if let logLevel = json["logLevel"].string {
        self.logLevel = logLevel
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let sessionId = self.sessionId {
        dictionary["sessionId"] = sessionId
    }
    
    if let user = self.user {
        dictionary["user"] = user.asDictionary()
    }
    
    if let logLevel = self.logLevel {
        dictionary["logLevel"] = logLevel
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
    case EMAIL_OR_PASSWORD_NOT_SET
    case USER_NOT_FOUND
    case USER_INACTIVE
    case PASSWORD_FAILED
}

}
