import Foundation
import SwiftyJSON

struct WsGetOrg {

    class Request: WsRequest {
        typealias Response = WsGetOrg.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/org/get"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetOrg.Code?
    var orgDetail: WsGetOrg.OrgDetail?

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
        if let code = WsGetOrg.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.orgDetail = WsGetOrg.OrgDetail(json: json["orgDetail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let orgDetail = self.orgDetail {
        dictionary["orgDetail"] = orgDetail.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case GET_FAILED
    case NOT_FOUND
    case FAILED
}

class OrgDetail: JSONSerializable {
    var id: String?
    var name: String?
    var type_: OrgType?
    var address: Address?
    var email: Email?
    var publicVisible: Bool?
    var active: Bool?

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
    
    self.address = Address(json: json["address"])
    
    self.email = Email(json: json["email"])
    
    if let publicVisible = json["publicVisible"].bool {
        self.publicVisible = publicVisible
    }
    
    if let active = json["active"].bool {
        self.active = active
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
    
    if let address = self.address {
        dictionary["address"] = address.asDictionary()
    }
    
    if let email = self.email {
        dictionary["email"] = email.asDictionary()
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

}
