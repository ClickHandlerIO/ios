import Foundation
import SwiftyJSON

struct WsListMessages {

    class Request: WsRequest {
        typealias Response = WsListMessages.Response
        
        var lastDate: Int?
        var lastRecordId: String?
        var pageSize: Int?
        var conversationId: String?
        
        class func getPath() -> String {
            return "/messaging/message/list"
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
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let conversationId = json["conversationId"].string {
                self.conversationId = conversationId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let conversationId = self.conversationId {
                dictionary["conversationId"] = conversationId
            }
            
            return dictionary
        }
    }

class Message: JSONSerializable {
    var messageEntity: MessageEntity?
    var participants: [MessageParticipantEntity]?

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
    
    self.messageEntity = MessageEntity(json: json["messageEntity"])
    
    if let participantsArrayValue = json["participants"].array {
        self.participants = []
        for item in participantsArrayValue {
            if let value = MessageParticipantEntity(json: item), var participants = participants {
                participants.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let messageEntity = self.messageEntity {
        dictionary["messageEntity"] = messageEntity.asDictionary()
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListMessages.Code?
    var data: [WsListMessages.Message]?

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
        if let code = WsListMessages.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let dataArrayValue = json["data"].array {
        self.data = []
        for item in dataArrayValue {
            if let value = WsListMessages.Message(json: item), var data = data {
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
    case INVALID_CONVERSATION_ID
    case INVALID_PAGE_SIZE
    case LAST_DATE_NEEDED
    case FAILED
}

}
