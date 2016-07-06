import Foundation
import GRDBCipher
import SwiftyJSON

class ConversationEntity: AbstractEntity {
    var createdByParticipantId: String?
    var createdDate: Int?
    var closed: Bool?
    var closedDate: Int?
    var subject: String?
    var urgency: Int?
    var lastMessageId: String?

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
    
    if let createdByParticipantId = json["createdByParticipantId"].string {
        self.createdByParticipantId = createdByParticipantId
    }
    
    if let closed = json["closed"].bool {
        self.closed = closed
    }
    
    if let subject = json["subject"].string {
        self.subject = subject
    }
    
    if let lastMessageId = json["lastMessageId"].string {
        self.lastMessageId = lastMessageId
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let createdByParticipantId = self.createdByParticipantId {
        dictionary["createdByParticipantId"] = createdByParticipantId
    }
    
    if let closed = self.closed {
        dictionary["closed"] = closed
    }
    
    if let subject = self.subject {
        dictionary["subject"] = subject
    }
    
    if let lastMessageId = self.lastMessageId {
        dictionary["lastMessageId"] = lastMessageId
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
