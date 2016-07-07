import Foundation
import SwiftyJSON

struct WsListDelegateOptions {

    class Request: WsRequest {
        typealias Response = WsListDelegateOptions.Response
        
        var entityId: String?
        var type_: DirectoryNonPersonType?
        var search: String?
        
        class func getPath() -> String {
            return "/dir/delegate/listoptions"
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
            
            if let entityId = json["entityId"].string {
                self.entityId = entityId
            }
            
            if let type_StringValue = json["type"].string {
                if let type_ = DirectoryNonPersonType(rawValue: type_StringValue) {
                    self.type_ = type_
                }
            }
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let entityId = self.entityId {
                dictionary["entityId"] = entityId
            }
            
            if let type_ = self.type_ {
                dictionary["type"] = type_.rawValue
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class DelegateOption: JSONSerializable {
    var id: String?
    var type_: PersonType?
    var name: PersonName?
    var email: Email?

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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let type_StringValue = json["type"].string {
        if let type_ = PersonType(rawValue: type_StringValue) {
            self.type_ = type_
        }
    }
    
    self.name = PersonName(json: json["name"])
    
    self.email = Email(json: json["email"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let type_ = self.type_ {
        dictionary["type"] = type_.rawValue
    }
    
    if let name = self.name {
        dictionary["name"] = name.asDictionary()
    }
    
    if let email = self.email {
        dictionary["email"] = email.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case INVALID_ENTITY_ID
    case EMPTY_TYPE
    case INVALID_TYPE
    case OU_NOT_FOUND
    case FACILITY_NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListDelegateOptions.Code?
    var delegateOptions: [WsListDelegateOptions.DelegateOption]?

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
        if let code = WsListDelegateOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let delegateOptionsArrayValue = json["delegateOptions"].array {
        self.delegateOptions = []
        for item in delegateOptionsArrayValue {
            if let value = WsListDelegateOptions.DelegateOption(json: item), var delegateOptions = delegateOptions {
                delegateOptions.append(value)
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
