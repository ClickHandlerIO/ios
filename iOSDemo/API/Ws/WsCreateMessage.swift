import Foundation
import SwiftyJSON

struct WsCreateMessage {

    class Request: WsRequest {
        typealias Response = WsCreateMessage.Response
        
        var fromParticipantId: String?
        var messageContent: String?
        var targetParticipants: Set<String>?
        
        class func getPath() -> String {
            return "/messaging/message/create"
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
            
            if let fromParticipantId = json["fromParticipantId"].string {
                self.fromParticipantId = fromParticipantId
            }
            
            if let messageContent = json["messageContent"].string {
                self.messageContent = messageContent
            }
            
            if let targetParticipantsArrayValue = json["targetParticipants"].array {
                self.targetParticipants = []
                for item in targetParticipantsArrayValue {
                    if var targetParticipants = targetParticipants, let itemValue = item.string {
                        targetParticipants.insert(itemValue)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let fromParticipantId = self.fromParticipantId {
                dictionary["fromParticipantId"] = fromParticipantId
            }
            
            if let messageContent = self.messageContent {
                dictionary["messageContent"] = messageContent
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateMessage.Code?
    var message: MessageEntity?

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
        if let code = WsCreateMessage.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.message = MessageEntity(json: json["message"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let message = self.message {
        dictionary["message"] = message.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case EMPTY_MESSAGE
    case PARTICIPANT_NOT_FOUND
    case FAILED
}

}
