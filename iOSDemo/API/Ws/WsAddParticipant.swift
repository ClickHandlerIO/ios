import Foundation
import SwiftyJSON

struct WsAddParticipant {

    class Request: WsRequest {
        typealias Response = WsAddParticipant.Response
        
        var conversationId: String?
        var contactId: String?
        
        class func getPath() -> String {
            return "/messaging/participant/add"
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
            
            if let conversationId = json["conversationId"].string {
                self.conversationId = conversationId
            }
            
            if let contactId = json["contactId"].string {
                self.contactId = contactId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let conversationId = self.conversationId {
                dictionary["conversationId"] = conversationId
            }
            
            if let contactId = self.contactId {
                dictionary["contactId"] = contactId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CONVERSATION_NOT_FOUND
    case CONTACT_NOT_FOUND
    case FAILED
    case COULD_NOT_NOTIFY_USERS
}

class Response: JSONSerializable {
    var code: WsAddParticipant.Code?
    var adds: [ConversationParticipantEntity]?

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
        if let code = WsAddParticipant.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let addsArrayValue = json["adds"].array {
        self.adds = []
        for item in addsArrayValue {
            if let value = ConversationParticipantEntity(json: item), var adds = adds {
                adds.append(value)
            }
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
