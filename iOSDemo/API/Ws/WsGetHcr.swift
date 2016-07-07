import Foundation
import SwiftyJSON

struct WsGetHcr {

    class Request: WsRequest {
        typealias Response = WsGetHcr.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/hcr/get"
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

class HcrDetail: JSONSerializable {
    var id: String?
    var orgId: String?
    var orgType: OrgType?
    var orgName: String?
    var hcrType: HcrType?
    var name: PersonName?
    var email: Email?
    var workPhoneNumber: PhoneNumber?
    var mobilePhoneNumber: PhoneNumber?
    var faxNumber: PhoneNumber?
    var active: Bool?
    var workingHomeId: String?
    var workingHomeName: String?
    var workingAtId: String?
    var workingAtName: String?
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
    
    if let hcrTypeStringValue = json["hcrType"].string {
        if let hcrType = HcrType(rawValue: hcrTypeStringValue) {
            self.hcrType = hcrType
        }
    }
    
    self.name = PersonName(json: json["name"])
    
    self.email = Email(json: json["email"])
    
    self.workPhoneNumber = PhoneNumber(json: json["workPhoneNumber"])
    
    self.mobilePhoneNumber = PhoneNumber(json: json["mobilePhoneNumber"])
    
    self.faxNumber = PhoneNumber(json: json["faxNumber"])
    
    if let active = json["active"].bool {
        self.active = active
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
    
    if let hcrType = self.hcrType {
        dictionary["hcrType"] = hcrType.rawValue
    }
    
    if let name = self.name {
        dictionary["name"] = name.asDictionary()
    }
    
    if let email = self.email {
        dictionary["email"] = email.asDictionary()
    }
    
    if let workPhoneNumber = self.workPhoneNumber {
        dictionary["workPhoneNumber"] = workPhoneNumber.asDictionary()
    }
    
    if let mobilePhoneNumber = self.mobilePhoneNumber {
        dictionary["mobilePhoneNumber"] = mobilePhoneNumber.asDictionary()
    }
    
    if let faxNumber = self.faxNumber {
        dictionary["faxNumber"] = faxNumber.asDictionary()
    }
    
    if let active = self.active {
        dictionary["active"] = active
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
    case INVALID_HCR_ID
}

class Response: JSONSerializable {
    var code: WsGetHcr.Code?
    var detail: WsGetHcr.HcrDetail?

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
        if let code = WsGetHcr.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetHcr.HcrDetail(json: json["detail"])
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
