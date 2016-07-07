import Foundation
import SwiftyJSON

struct WsMarkMessagesRead {

    class Request: WsRequest {
        typealias Response = WsMarkMessagesRead.Response
        
        var participantIds: [String]?
        var read: Bool?
        
        class func getPath() -> String {
            return "/messaging/conversation/markreadmultiple"
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
            
            if let participantIdsArrayValue = json["participantIds"].array {
                self.participantIds = []
                for item in participantIdsArrayValue {
                    if var participantIds = participantIds, let itemValue = item.string {
                        participantIds.append(itemValue)
                    }
                }
            }
            
            if let read = json["read"].bool {
                self.read = read
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let read = self.read {
                dictionary["read"] = read
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsMarkMessagesRead.Code?
    var markReadResponses: [WsMarkMessagesRead.MarkReadResult]?

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
        if let code = WsMarkMessagesRead.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let markReadResponsesArrayValue = json["markReadResponses"].array {
        self.markReadResponses = []
        for item in markReadResponsesArrayValue {
            if let value = WsMarkMessagesRead.MarkReadResult(json: item), var markReadResponses = markReadResponses {
                markReadResponses.append(value)
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

class MarkReadResult: JSONSerializable {
    var participantId: String?
    var code: WsMarkMessageRead.Code?

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
        if let code = WsMarkMessageRead.Code(rawValue: codeStringValue) {
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

}
