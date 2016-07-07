import Foundation
import SwiftyJSON

struct WsGetDce {

    class Request: WsRequest {
        typealias Response = WsGetDce.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/dce/get"
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

class DceDetail: JSONSerializable {
    var id: String?
    var orgId: String?
    var orgType: OrgType?
    var orgName: String?
    var workingHomeId: String?
    var workingHomeName: String?
    var workingAtId: String?
    var workingAtName: String?
    var name: PersonName?
    var email: Email?
    var active: Bool?
    var userId: String?
    var userPerspective: UserPerspective?
    var userStatus: UserStatus?
    var timeZone: TZ?

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
    
    if let workingHomeId = json["workingHomeId"].string {
        self.workingHomeId = workingHomeId
    }
    
    if let workingHomeName = json["workingHomeName"].string {
        self.workingHomeName = workingHomeName
    }
    
    if let workingAtId = json["workingAtId"].string {
        self.workingAtId = workingAtId
    }
    
    if let workingAtName = json["workingAtName"].string {
        self.workingAtName = workingAtName
    }
    
    self.name = PersonName(json: json["name"])
    
    self.email = Email(json: json["email"])
    
    if let active = json["active"].bool {
        self.active = active
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    if let userPerspectiveStringValue = json["userPerspective"].string {
        if let userPerspective = UserPerspective(rawValue: userPerspectiveStringValue) {
            self.userPerspective = userPerspective
        }
    }
    
    if let userStatusStringValue = json["userStatus"].string {
        if let userStatus = UserStatus(rawValue: userStatusStringValue) {
            self.userStatus = userStatus
        }
    }
    
    if let timeZoneStringValue = json["timeZone"].string {
        if let timeZone = TZ(rawValue: timeZoneStringValue) {
            self.timeZone = timeZone
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
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
    
    if let workingHomeId = self.workingHomeId {
        dictionary["workingHomeId"] = workingHomeId
    }
    
    if let workingHomeName = self.workingHomeName {
        dictionary["workingHomeName"] = workingHomeName
    }
    
    if let workingAtId = self.workingAtId {
        dictionary["workingAtId"] = workingAtId
    }
    
    if let workingAtName = self.workingAtName {
        dictionary["workingAtName"] = workingAtName
    }
    
    if let name = self.name {
        dictionary["name"] = name.asDictionary()
    }
    
    if let email = self.email {
        dictionary["email"] = email.asDictionary()
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let userPerspective = self.userPerspective {
        dictionary["userPerspective"] = userPerspective.rawValue
    }
    
    if let userStatus = self.userStatus {
        dictionary["userStatus"] = userStatus.rawValue
    }
    
    if let timeZone = self.timeZone {
        dictionary["timeZone"] = timeZone.rawValue
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
    case NOT_FOUND
    case INVALID_DCE_ID
}

class Response: JSONSerializable {
    var code: WsGetDce.Code?
    var detail: WsGetDce.DceDetail?

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
        if let code = WsGetDce.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetDce.DceDetail(json: json["detail"])
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
