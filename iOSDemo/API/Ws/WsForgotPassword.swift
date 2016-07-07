import Foundation
import SwiftyJSON

struct WsForgotPassword {

    class Request: WsRequest {
        typealias Response = WsForgotPassword.Response
        
        var email: String?
        
        class func getPath() -> String {
            return "/forgot"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let email = self.email {
                dictionary["email"] = email
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NO_ACCOUNT_FOR_EMAIL_ADDRESS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsForgotPassword.Code?

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
        if let code = WsForgotPassword.Code(rawValue: codeStringValue) {
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

}
