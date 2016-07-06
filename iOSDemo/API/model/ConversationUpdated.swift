import Foundation
import SwiftyJSON

class ConversationUpdated: JSONSerializable {
    var conversationId: String?

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
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let conversationId = self.conversationId {
        dictionary["conversationId"] = conversationId
    }
    
    return dictionary
}
}
