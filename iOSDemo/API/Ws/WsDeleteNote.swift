import Foundation
import SwiftyJSON

struct WsDeleteNote {

    class Request: WsRequest {
        typealias Response = WsDeleteNote.Response
        
        var noteId: String?
        
        class func getPath() -> String {
            return "/attributable/notes/deletenote"
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
            
            if let noteId = json["noteId"].string {
                self.noteId = noteId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let noteId = self.noteId {
                dictionary["noteId"] = noteId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NOTE_ID_REQUIRED
    case NOT_IMPLEMENTED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsDeleteNote.Code?

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
        if let code = WsDeleteNote.Code(rawValue: codeStringValue) {
            self.code = code
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
