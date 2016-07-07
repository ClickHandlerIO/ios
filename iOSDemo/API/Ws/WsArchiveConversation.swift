import Foundation
import SwiftyJSON

struct WsArchiveConversation {

    class Request: WsRequest {
        typealias Response = WsArchiveConversation.Response
        
        var participantId: String?
        var archive: Bool?
        
        class func getPath() -> String {
            return "/messaging/conversation/archive"
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
            
            if let participantId = json["participantId"].string {
                self.participantId = participantId
            }
            
            if let archive = json["archive"].bool {
                self.archive = archive
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let participantId = self.participantId {
                dictionary["participantId"] = participantId
            }
            
            if let archive = self.archive {
                dictionary["archive"] = archive
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var participantId: String?
    var code: WsArchiveConversation.Code?

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
    
    if let participantId = json["participantId"].string {
        self.participantId = participantId
    }
    
    if let codeStringValue = json["code"].string {
        if let code = WsArchiveConversation.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let participantId = self.participantId {
        dictionary["participantId"] = participantId
    }
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
    case COULD_NOT_NOTIFY_USERS
    case NOT_FOUND
}

}
