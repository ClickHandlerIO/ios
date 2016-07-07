import Foundation
import SwiftyJSON

struct WsListUsersForAssignPick {

    class Request: WsRequest {
        typealias Response = WsListUsersForAssignPick.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/inventory/pick/listusersforassignpick"
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
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case PICK_ID_REQUIRED
    case USER_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

class NamedUser: JSONSerializable {
    var userId: String?
    var name: String?

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
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListUsersForAssignPick.Code?
    var namedUsers: [WsListUsersForAssignPick.NamedUser]?

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
        if let code = WsListUsersForAssignPick.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let namedUsersArrayValue = json["namedUsers"].array {
        self.namedUsers = []
        for item in namedUsersArrayValue {
            if let value = WsListUsersForAssignPick.NamedUser(json: item), var namedUsers = namedUsers {
                namedUsers.append(value)
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
