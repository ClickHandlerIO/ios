import Foundation
import SwiftyJSON

struct WsListConversations {

    class Request: WsRequest {
        typealias Response = WsListConversations.Response
        
        var archived: Bool?
        var closed: Bool?
        var unread: Bool?
        var contactIds: [String]?
        var lastDate: Int?
        var attributableType: AttributableType?
        var attrId: String?
        var lastRecordId: String?
        var pageSize: Int?
        
        class func getPath() -> String {
            return "/messaging/conversation/list"
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
            
            if let archived = json["archived"].bool {
                self.archived = archived
            }
            
            if let closed = json["closed"].bool {
                self.closed = closed
            }
            
            if let unread = json["unread"].bool {
                self.unread = unread
            }
            
            if let contactIdsArrayValue = json["contactIds"].array {
                self.contactIds = []
                for item in contactIdsArrayValue {
                    if var contactIds = contactIds, let itemValue = item.string {
                        contactIds.append(itemValue)
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
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let archived = self.archived {
                dictionary["archived"] = archived
            }
            
            if let closed = self.closed {
                dictionary["closed"] = closed
            }
            
            if let unread = self.unread {
                dictionary["unread"] = unread
            }
            
            if let attributableType = self.attributableType {
                dictionary["attributableType"] = attributableType.rawValue
            }
            
            if let attrId = self.attrId {
                dictionary["attrId"] = attrId
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
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

class Conversation: JSONSerializable {
    var conversationEntity: ConversationEntity?
    var lastMessage: MessageEntity?
    var lastSender: ContactEntity?
    var participants: [WsListConversations.Participant]?
    var linkInfos: [WsListConversations.LinkInfo]?
    var unread: Int?
    var unreadTargeted: Int?

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
    
    self.conversationEntity = ConversationEntity(json: json["conversationEntity"])
    
    self.lastMessage = MessageEntity(json: json["lastMessage"])
    
    self.lastSender = ContactEntity(json: json["lastSender"])
    
    if let participantsArrayValue = json["participants"].array {
        self.participants = []
        for item in participantsArrayValue {
            if let value = WsListConversations.Participant(json: item), var participants = participants {
                participants.append(value)
            }
        }
    }
    
    if let linkInfosArrayValue = json["linkInfos"].array {
        self.linkInfos = []
        for item in linkInfosArrayValue {
            if let value = WsListConversations.LinkInfo(json: item), var linkInfos = linkInfos {
                linkInfos.append(value)
            }
        }
    }
    
    if let unread = json["unread"].int {
        self.unread = unread
    }
    
    if let unreadTargeted = json["unreadTargeted"].int {
        self.unreadTargeted = unreadTargeted
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let conversationEntity = self.conversationEntity {
        dictionary["conversationEntity"] = conversationEntity.asDictionary()
    }
    
    if let lastMessage = self.lastMessage {
        dictionary["lastMessage"] = lastMessage.asDictionary()
    }
    
    if let lastSender = self.lastSender {
        dictionary["lastSender"] = lastSender.asDictionary()
    }
    
    if let unread = self.unread {
        dictionary["unread"] = unread
    }
    
    if let unreadTargeted = self.unreadTargeted {
        dictionary["unreadTargeted"] = unreadTargeted
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListConversations.Code?
    var data: [WsListConversations.Conversation]?

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
        if let code = WsListConversations.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let dataArrayValue = json["data"].array {
        self.data = []
        for item in dataArrayValue {
            if let value = WsListConversations.Conversation(json: item), var data = data {
                data.append(value)
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

enum Code: String {
    case SUCCESS
    case FAILED
}

}
