import Foundation
import GRDBCipher
import SwiftyJSON

class MessageEntity: AbstractEntity {
    var conversationId: String?
    var fromParticipantId: String?
    var behalfOfParticipantId: String?
    var sentDate: Int?
    var messagePreview: String?
    var messageContent: String?

// JSON

required init() {
    super.init()
}

convenience required init?(json: JSON?) {
    guard let json = json else {
        return nil
    }
    self.init()
    self.merge(json)
}

override func merge(json: JSON?) {
    guard let json = json else {
        return
    }
    
    if let conversationId = json["conversationId"].string {
        self.conversationId = conversationId
    }
    
    if let fromParticipantId = json["fromParticipantId"].string {
        self.fromParticipantId = fromParticipantId
    }
    
    if let behalfOfParticipantId = json["behalfOfParticipantId"].string {
        self.behalfOfParticipantId = behalfOfParticipantId
    }
    
    if let messagePreview = json["messagePreview"].string {
        self.messagePreview = messagePreview
    }
    
    if let messageContent = json["messageContent"].string {
        self.messageContent = messageContent
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let conversationId = self.conversationId {
        dictionary["conversationId"] = conversationId
    }
    
    if let fromParticipantId = self.fromParticipantId {
        dictionary["fromParticipantId"] = fromParticipantId
    }
    
    if let behalfOfParticipantId = self.behalfOfParticipantId {
        dictionary["behalfOfParticipantId"] = behalfOfParticipantId
    }
    
    if let messagePreview = self.messagePreview {
        dictionary["messagePreview"] = messagePreview
    }
    
    if let messageContent = self.messageContent {
        dictionary["messageContent"] = messageContent
    }
    
    return dictionary
}

// SQL

override class func databaseTableCreateSql() -> String {
    return ""
}

required init(_ row: Row) {
    super.init(row)
}

override var persistentDictionary: [String:DatabaseValueConvertible?] {
    return [:]
}
}
