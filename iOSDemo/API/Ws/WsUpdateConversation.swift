import Foundation
import SwiftyJSON

struct WsUpdateConversation {

    class Request: WsRequest {
        typealias Response = WsUpdateConversation.Response
        
        var id: String?
        var closed: Bool?
        var subject: String?
        var urgency: Int?
        
        class func getPath() -> String {
            return "/messaging/conversation/update"
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
            
            if let closed = json["closed"].bool {
                self.closed = closed
            }
            
            if let subject = json["subject"].string {
                self.subject = subject
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let closed = self.closed {
                dictionary["closed"] = closed
            }
            
            if let subject = self.subject {
                dictionary["subject"] = subject
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
    case NOT_FOUND
    case COULD_NOT_NOTIFY_USERS
}

class Response: JSONSerializable {
    var code: WsUpdateConversation.Code?
    var entity: ConversationEntity?

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
        if let code = WsUpdateConversation.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.entity = ConversationEntity(json: json["entity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let entity = self.entity {
        dictionary["entity"] = entity.asDictionary()
    }
    
    return dictionary
}
}

}
