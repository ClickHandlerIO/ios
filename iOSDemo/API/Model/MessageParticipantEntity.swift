import Foundation
import GRDBCipher
import SwiftyJSON

class MessageParticipantEntity: AbstractEntity {
    var messageId: String?
    var participantId: String?
    var read: Bool?
    var target: Bool?

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
    
    if let messageId = json["messageId"].string {
        self.messageId = messageId
    }
    
    if let participantId = json["participantId"].string {
        self.participantId = participantId
    }
    
    if let read = json["read"].bool {
        self.read = read
    }
    
    if let target = json["target"].bool {
        self.target = target
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let messageId = self.messageId {
        dictionary["messageId"] = messageId
    }
    
    if let participantId = self.participantId {
        dictionary["participantId"] = participantId
    }
    
    if let read = self.read {
        dictionary["read"] = read
    }
    
    if let target = self.target {
        dictionary["target"] = target
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
