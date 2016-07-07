import Foundation
import SwiftyJSON

struct WsListContactsTo {

    class Request: WsRequest {
        typealias Response = WsListContactsTo.Response
        
        var conversationId: String?
        var searchTerm: String?
        
        class func getPath() -> String {
            return "/messaging/contact/listto"
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
            
            if let conversationId = json["conversationId"].string {
                self.conversationId = conversationId
            }
            
            if let searchTerm = json["searchTerm"].string {
                self.searchTerm = searchTerm
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let conversationId = self.conversationId {
                dictionary["conversationId"] = conversationId
            }
            
            if let searchTerm = self.searchTerm {
                dictionary["searchTerm"] = searchTerm
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListContactsTo.Code?
    var contacts: [WsListContactsTo.Contact]?

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
        if let code = WsListContactsTo.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let contactsArrayValue = json["contacts"].array {
        self.contacts = []
        for item in contactsArrayValue {
            if let value = WsListContactsTo.Contact(json: item), var contacts = contacts {
                contacts.append(value)
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

class Contact: JSONSerializable {
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
    
    self.contactEntity = ContactEntity(json: json["contactEntity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let contactEntity = self.contactEntity {
        dictionary["contactEntity"] = contactEntity.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
}

}
