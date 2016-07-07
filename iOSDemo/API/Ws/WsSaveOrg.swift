import Foundation
import SwiftyJSON

struct WsSaveOrg {

    class Request: WsRequest {
        typealias Response = WsSaveOrg.Response
        
        var id: String?
        var name: String?
        var type_: OrgType?
        var email: Email?
        var address: Address?
        var active: Bool?
        var publicVisible: Bool?
        
        class func getPath() -> String {
            return "/dir/org/save"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let type_StringValue = json["type"].string {
                if let type_ = OrgType(rawValue: type_StringValue) {
                    self.type_ = type_
                }
            }
            
            self.email = Email(json: json["email"])
            
            self.address = Address(json: json["address"])
            
            if let active = json["active"].bool {
                self.active = active
            }
            
            if let publicVisible = json["publicVisible"].bool {
                self.publicVisible = publicVisible
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let type_ = self.type_ {
                dictionary["type"] = type_.rawValue
            }
            
            if let email = self.email {
                dictionary["email"] = email.asDictionary()
            }
            
            if let address = self.address {
                dictionary["address"] = address.asDictionary()
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            if let publicVisible = self.publicVisible {
                dictionary["publicVisible"] = publicVisible
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case EMPTY_NAME
    case EMPTY_TYPE
    case EMPTY_ADDRESS
    case NOT_FOUND
    case EMPTY_EMAIL
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveOrg.Code?
    var id: String?

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
        if let code = WsSaveOrg.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    return dictionary
}
}

}
