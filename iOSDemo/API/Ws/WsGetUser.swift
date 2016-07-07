import Foundation
import SwiftyJSON

struct WsGetUser {

    class Request: WsRequest {
        typealias Response = WsGetUser.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/user/get"
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

enum Code: String {
    case SUCCESS
    case FAILED
    case NOT_FOUND
    case ORG_NOT_FOUND
    case INVALID_ID
}

class UserDetail: JSONSerializable {
    var id: String?
    var userPerspective: UserPerspective?
    var linkedId: String?
    var email: String?
    var signupDate: Int?
    var username: String?
    var timeZone: TZ?
    var availablePerspective: AvailablePerspective?
    var status: UserStatus?
    var orgId: String?
    var orgType: OrgType?
    var orgName: String?

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
    
    if let userPerspectiveStringValue = json["userPerspective"].string {
        if let userPerspective = UserPerspective(rawValue: userPerspectiveStringValue) {
            self.userPerspective = userPerspective
        }
    }
    
    if let linkedId = json["linkedId"].string {
        self.linkedId = linkedId
    }
    
    if let email = json["email"].string {
        self.email = email
    }
    
    if let username = json["username"].string {
        self.username = username
    }
    
    if let timeZoneStringValue = json["timeZone"].string {
        if let timeZone = TZ(rawValue: timeZoneStringValue) {
            self.timeZone = timeZone
        }
    }
    
    if let availablePerspectiveStringValue = json["availablePerspective"].string {
        if let availablePerspective = AvailablePerspective(rawValue: availablePerspectiveStringValue) {
            self.availablePerspective = availablePerspective
        }
    }
    
    if let statusStringValue = json["status"].string {
        if let status = UserStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let orgName = json["orgName"].string {
        self.orgName = orgName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let userPerspective = self.userPerspective {
        dictionary["userPerspective"] = userPerspective.rawValue
    }
    
    if let linkedId = self.linkedId {
        dictionary["linkedId"] = linkedId
    }
    
    if let email = self.email {
        dictionary["email"] = email
    }
    
    if let username = self.username {
        dictionary["username"] = username
    }
    
    if let timeZone = self.timeZone {
        dictionary["timeZone"] = timeZone.rawValue
    }
    
    if let availablePerspective = self.availablePerspective {
        dictionary["availablePerspective"] = availablePerspective.rawValue
    }
    
    if let status = self.status {
        dictionary["status"] = status.rawValue
    }
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let orgName = self.orgName {
        dictionary["orgName"] = orgName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsGetUser.Code?
    var detail: WsGetUser.UserDetail?

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
        if let code = WsGetUser.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetUser.UserDetail(json: json["detail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let detail = self.detail {
        dictionary["detail"] = detail.asDictionary()
    }
    
    return dictionary
}
}

}
