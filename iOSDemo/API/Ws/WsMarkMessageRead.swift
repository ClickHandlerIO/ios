import Foundation
import SwiftyJSON

struct WsMarkMessageRead {

    class Request: WsRequest {
        typealias Response = WsMarkMessageRead.Response
        
        var messageParticipantId: String?
        var read: Bool?
        
        class func getPath() -> String {
            return "/messaging/conversation/markread"
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
            
            if let messageParticipantId = json["messageParticipantId"].string {
                self.messageParticipantId = messageParticipantId
            }
            
            if let read = json["read"].bool {
                self.read = read
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let messageParticipantId = self.messageParticipantId {
                dictionary["messageParticipantId"] = messageParticipantId
            }
            
            if let read = self.read {
                dictionary["read"] = read
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
    case NOT_FOUND
}

class Response: JSONSerializable {
    var code: WsMarkMessageRead.Code?
    var messageParticipantId: String?

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
        if let code = WsMarkMessageRead.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let messageParticipantId = json["messageParticipantId"].string {
        self.messageParticipantId = messageParticipantId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let messageParticipantId = self.messageParticipantId {
        dictionary["messageParticipantId"] = messageParticipantId
    }
    
    return dictionary
}
}

}
