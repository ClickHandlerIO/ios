import Foundation
import SwiftyJSON

struct WsGetConversation {

    class Request: WsRequest {
        typealias Response = WsGetConversation.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/messaging/conversation/get"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetConversation.Code?
    var conversationEntity: ConversationEntity?
    var messagesResponse: WsListMessages.Response?
    var behalfOfParticipants: [WsGetConversation.Participant]?
    var allParticipants: [WsGetConversation.Participant]?
    var linkInfos: [WsGetConversation.LinkInfo]?

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
        if let code = WsGetConversation.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.conversationEntity = ConversationEntity(json: json["conversationEntity"])
    
    self.messagesResponse = WsListMessages.Response(json: json["messagesResponse"])
    
    if let behalfOfParticipantsArrayValue = json["behalfOfParticipants"].array {
        self.behalfOfParticipants = []
        for item in behalfOfParticipantsArrayValue {
            if let value = WsGetConversation.Participant(json: item), var behalfOfParticipants = behalfOfParticipants {
                behalfOfParticipants.append(value)
            }
        }
    }
    
    if let allParticipantsArrayValue = json["allParticipants"].array {
        self.allParticipants = []
        for item in allParticipantsArrayValue {
            if let value = WsGetConversation.Participant(json: item), var allParticipants = allParticipants {
                allParticipants.append(value)
            }
        }
    }
    
    if let linkInfosArrayValue = json["linkInfos"].array {
        self.linkInfos = []
        for item in linkInfosArrayValue {
            if let value = WsGetConversation.LinkInfo(json: item), var linkInfos = linkInfos {
                linkInfos.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let conversationEntity = self.conversationEntity {
        dictionary["conversationEntity"] = conversationEntity.asDictionary()
    }
    
    if let messagesResponse = self.messagesResponse {
        dictionary["messagesResponse"] = messagesResponse.asDictionary()
    }
    
    return dictionary
}
}

class LinkInfo: JSONSerializable {
    var attrId: String?
    var attrType: AttributableType?
    var linkDisplayText: String?

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
    
    if let attrId = json["attrId"].string {
        self.attrId = attrId
    }
    
    if let attrTypeStringValue = json["attrType"].string {
        if let attrType = AttributableType(rawValue: attrTypeStringValue) {
            self.attrType = attrType
        }
    }
    
    if let linkDisplayText = json["linkDisplayText"].string {
        self.linkDisplayText = linkDisplayText
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let attrId = self.attrId {
        dictionary["attrId"] = attrId
    }
    
    if let attrType = self.attrType {
        dictionary["attrType"] = attrType.rawValue
    }
    
    if let linkDisplayText = self.linkDisplayText {
        dictionary["linkDisplayText"] = linkDisplayText
    }
    
    return dictionary
}
}

class Participant: JSONSerializable {
    var participantEntity: ConversationParticipantEntity?
    var contactEntity: ContactEntity?

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
    
    self.participantEntity = ConversationParticipantEntity(json: json["participantEntity"])
    
    self.contactEntity = ContactEntity(json: json["contactEntity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let participantEntity = self.participantEntity {
        dictionary["participantEntity"] = participantEntity.asDictionary()
    }
    
    if let contactEntity = self.contactEntity {
        dictionary["contactEntity"] = contactEntity.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case NOT_FOUND
    case FAILED
}

}
