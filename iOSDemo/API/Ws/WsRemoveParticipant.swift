import Foundation
import SwiftyJSON

struct WsRemoveParticipant {

    class Request: WsRequest {
        typealias Response = WsRemoveParticipant.Response
        
        var participantId: String?
        
        class func getPath() -> String {
            return "/messaging/participant/remove"
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
            
            if let participantId = json["participantId"].string {
                self.participantId = participantId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let participantId = self.participantId {
                dictionary["participantId"] = participantId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case NOT_FOUND
    case COULD_NOT_NOTIFY_USERS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsRemoveParticipant.Code?

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
        if let code = WsRemoveParticipant.Code(rawValue: codeStringValue) {
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
