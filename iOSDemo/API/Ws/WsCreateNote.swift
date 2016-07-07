import Foundation
import SwiftyJSON

struct WsCreateNote {

    class Request: WsRequest {
        typealias Response = WsCreateNote.Response
        
        var ownerOrgUnitId: String?
        var attrType: AttributableType?
        var attrId: String?
        var visibility: Visibility?
        var noteValue: String?
        
        class func getPath() -> String {
            return "/attributable/notes/createnote"
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
            
            if let ownerOrgUnitId = json["ownerOrgUnitId"].string {
                self.ownerOrgUnitId = ownerOrgUnitId
            }
            
            if let attrTypeStringValue = json["attrType"].string {
                if let attrType = AttributableType(rawValue: attrTypeStringValue) {
                    self.attrType = attrType
                }
            }
            
            if let attrId = json["attrId"].string {
                self.attrId = attrId
            }
            
            if let visibilityStringValue = json["visibility"].string {
                if let visibility = Visibility(rawValue: visibilityStringValue) {
                    self.visibility = visibility
                }
            }
            
            if let noteValue = json["noteValue"].string {
                self.noteValue = noteValue
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let ownerOrgUnitId = self.ownerOrgUnitId {
                dictionary["ownerOrgUnitId"] = ownerOrgUnitId
            }
            
            if let attrType = self.attrType {
                dictionary["attrType"] = attrType.rawValue
            }
            
            if let attrId = self.attrId {
                dictionary["attrId"] = attrId
            }
            
            if let visibility = self.visibility {
                dictionary["visibility"] = visibility.rawValue
            }
            
            if let noteValue = self.noteValue {
                dictionary["noteValue"] = noteValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case ATTR_TYPE_REQUIRED
    case ATTR_ID_REQUIRED
    case OWNER_ORG_UNIT_ID_REQUIRED
    case VISIBILITY_REQUIRED
    case NOTE_VALUE_REQUIRED
    case NOT_IMPLEMENTED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreateNote.Code?
    var noteId: String?

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
        if let code = WsCreateNote.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let noteId = json["noteId"].string {
        self.noteId = noteId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let noteId = self.noteId {
        dictionary["noteId"] = noteId
    }
    
    return dictionary
}
}

}
