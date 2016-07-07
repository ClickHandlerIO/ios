import Foundation
import SwiftyJSON

struct WsSaveContact {

    class Request: WsRequest {
        typealias Response = WsSaveContact.Response
        
        var linkedType: ContactType?
        var linkedId: String?
        var description: String?
        var publicVisible: Bool?
        var active: Bool?
        
        class func getPath() -> String {
            return "/messaging/contact/save"
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
            
            if let linkedTypeStringValue = json["linkedType"].string {
                if let linkedType = ContactType(rawValue: linkedTypeStringValue) {
                    self.linkedType = linkedType
                }
            }
            
            if let linkedId = json["linkedId"].string {
                self.linkedId = linkedId
            }
            
            if let description = json["description"].string {
                self.description = description
            }
            
            if let publicVisible = json["publicVisible"].bool {
                self.publicVisible = publicVisible
            }
            
            if let active = json["active"].bool {
                self.active = active
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let linkedType = self.linkedType {
                dictionary["linkedType"] = linkedType.rawValue
            }
            
            if let linkedId = self.linkedId {
                dictionary["linkedId"] = linkedId
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            if let publicVisible = self.publicVisible {
                dictionary["publicVisible"] = publicVisible
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsSaveContact.Code?
    var contactEntity: ContactEntity?

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
        if let code = WsSaveContact.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.contactEntity = ContactEntity(json: json["contactEntity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let contactEntity = self.contactEntity {
        dictionary["contactEntity"] = contactEntity.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case LINKED_TYPE_REQUIRED
    case LINKED_ID_REQUIRED
    case FAILED
}

}
