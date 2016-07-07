import Foundation
import SwiftyJSON

struct WsListContactsFrom {

    class Request: WsRequest {
        typealias Response = WsListContactsFrom.Response
        
        var searchTerm: String?
        
        class func getPath() -> String {
            return "/messaging/contact/listfrom"
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
            
            if let searchTerm = json["searchTerm"].string {
                self.searchTerm = searchTerm
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let searchTerm = self.searchTerm {
                dictionary["searchTerm"] = searchTerm
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListContactsFrom.Code?
    var contacts: [ContactEntity]?

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
        if let code = WsListContactsFrom.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let contactsArrayValue = json["contacts"].array {
        self.contacts = []
        for item in contactsArrayValue {
            if let value = ContactEntity(json: item), var contacts = contacts {
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

}
