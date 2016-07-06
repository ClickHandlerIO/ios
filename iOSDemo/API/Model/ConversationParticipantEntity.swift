import Foundation
import GRDBCipher
import SwiftyJSON

class ConversationParticipantEntity: AbstractEntity {
    var conversationId: String?
    var participantType: ConversationParticipantType?
    var linkedId: String?
    var behalfOfParticipantId: String?
    var conversationOwner: Bool?
    var participantActive: Bool?
    var conversationArchived: Bool?

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
    
    if let participantTypeStringValue = json["participantType"].string {
        if let participantType = ConversationParticipantType(rawValue: participantTypeStringValue) {
            self.participantType = participantType
        }
    }
    
    if let linkedId = json["linkedId"].string {
        self.linkedId = linkedId
    }
    
    if let behalfOfParticipantId = json["behalfOfParticipantId"].string {
        self.behalfOfParticipantId = behalfOfParticipantId
    }
    
    if let conversationOwner = json["conversationOwner"].bool {
        self.conversationOwner = conversationOwner
    }
    
    if let participantActive = json["participantActive"].bool {
        self.participantActive = participantActive
    }
    
    if let conversationArchived = json["conversationArchived"].bool {
        self.conversationArchived = conversationArchived
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let conversationId = self.conversationId {
        dictionary["conversationId"] = conversationId
    }
    
    if let participantType = self.participantType {
        dictionary["participantType"] = participantType.rawValue
    }
    
    if let linkedId = self.linkedId {
        dictionary["linkedId"] = linkedId
    }
    
    if let behalfOfParticipantId = self.behalfOfParticipantId {
        dictionary["behalfOfParticipantId"] = behalfOfParticipantId
    }
    
    if let conversationOwner = self.conversationOwner {
        dictionary["conversationOwner"] = conversationOwner
    }
    
    if let participantActive = self.participantActive {
        dictionary["participantActive"] = participantActive
    }
    
    if let conversationArchived = self.conversationArchived {
        dictionary["conversationArchived"] = conversationArchived
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
