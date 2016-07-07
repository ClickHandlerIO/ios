import Foundation
import SwiftyJSON

struct WsCreateConversation {

    class Request: WsRequest {
        typealias Response = WsCreateConversation.Response
        
        var startAsContact: ContactEntity?
        var subject: String?
        var message: String?
        var urgency: Int?
        var participantContacts: [ContactEntity]?
        var targetParticipantContacts: [ContactEntity]?
        var attributableType: AttributableType?
        var attrId: String?
        
        class func getPath() -> String {
            return "/messaging/conversation/create"
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
            
            self.startAsContact = ContactEntity(json: json["startAsContact"])
            
            if let subject = json["subject"].string {
                self.subject = subject
            }
            
            if let message = json["message"].string {
                self.message = message
            }
            
            if let participantContactsArrayValue = json["participantContacts"].array {
                self.participantContacts = []
                for item in participantContactsArrayValue {
                    if let value = ContactEntity(json: item), var participantContacts = participantContacts {
                        participantContacts.append(value)
                    }
                }
            }
            
            if let targetParticipantContactsArrayValue = json["targetParticipantContacts"].array {
                self.targetParticipantContacts = []
                for item in targetParticipantContactsArrayValue {
                    if let value = ContactEntity(json: item), var targetParticipantContacts = targetParticipantContacts {
                        targetParticipantContacts.append(value)
                    }
                }
            }
            
            if let attributableTypeStringValue = json["attributableType"].string {
                if let attributableType = AttributableType(rawValue: attributableTypeStringValue) {
                    self.attributableType = attributableType
                }
            }
            
            if let attrId = json["attrId"].string {
                self.attrId = attrId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let startAsContact = self.startAsContact {
                dictionary["startAsContact"] = startAsContact.asDictionary()
            }
            
            if let subject = self.subject {
                dictionary["subject"] = subject
            }
            
            if let message = self.message {
                dictionary["message"] = message
            }
            
            if let attributableType = self.attributableType {
                dictionary["attributableType"] = attributableType.rawValue
            }
            
            if let attrId = self.attrId {
                dictionary["attrId"] = attrId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case MESSAGE_REQUIRED
    case URGENCY_REQUIRED
    case FAILED
    case SUBJECT_REQUIRED
    case START_AS_CONTACT_NEEDED
    case PARTICIPANTS_REQUIRED
    case SENDER_IN_PARTICIPANTS_LIST
}

class Response: JSONSerializable {
    var code: WsCreateConversation.Code?
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
        if let code = WsCreateConversation.Code(rawValue: codeStringValue) {
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
