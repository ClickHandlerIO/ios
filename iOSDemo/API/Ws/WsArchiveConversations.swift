import Foundation
import SwiftyJSON

struct WsArchiveConversations {

    class Request: WsRequest {
        typealias Response = WsArchiveConversations.Response
        
        var participantIds: [String]?
        var archive: Bool?
        
        class func getPath() -> String {
            return "/messaging/conversation/archivemultiple"
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
            
            if let archive = json["archive"].bool {
                self.archive = archive
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let archive = self.archive {
                dictionary["archive"] = archive
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

class ArchiveResult: JSONSerializable {
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

class Response: JSONSerializable {
    var code: WsArchiveConversations.Code?
    var archiveResponses: [WsArchiveConversations.ArchiveResult]?

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
        if let code = WsArchiveConversations.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let archiveResponsesArrayValue = json["archiveResponses"].array {
        self.archiveResponses = []
        for item in archiveResponsesArrayValue {
            if let value = WsArchiveConversations.ArchiveResult(json: item), var archiveResponses = archiveResponses {
                archiveResponses.append(value)
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

}
