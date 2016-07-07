import Foundation
import SwiftyJSON

struct WsSaveHcp {

    class Request: WsRequest {
        typealias Response = WsSaveHcp.Response
        
        var id: String?
        var orgId: String?
        var name: PersonName?
        var hcpType: HcpType?
        var workPhoneNumber: PhoneNumber?
        var mobilePhoneNumber: PhoneNumber?
        var faxNumber: PhoneNumber?
        var workingHomeId: String?
        var workingAtId: String?
        var email: Email?
        var timeZone: TZ?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/hcp/save"
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
            
            if let orgId = json["orgId"].string {
                self.orgId = orgId
            }
            
            self.name = PersonName(json: json["name"])
            
            if let hcpTypeStringValue = json["hcpType"].string {
                if let hcpType = HcpType(rawValue: hcpTypeStringValue) {
                    self.hcpType = hcpType
                }
            }
            
            self.workPhoneNumber = PhoneNumber(json: json["workPhoneNumber"])
            
            self.mobilePhoneNumber = PhoneNumber(json: json["mobilePhoneNumber"])
            
            self.faxNumber = PhoneNumber(json: json["faxNumber"])
            
            if let workingHomeId = json["workingHomeId"].string {
                self.workingHomeId = workingHomeId
            }
            
            if let workingAtId = json["workingAtId"].string {
                self.workingAtId = workingAtId
            }
            
            self.email = Email(json: json["email"])
            
            if let timeZoneStringValue = json["timeZone"].string {
                if let timeZone = TZ(rawValue: timeZoneStringValue) {
                    self.timeZone = timeZone
                }
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
            
            if let orgId = self.orgId {
                dictionary["orgId"] = orgId
            }
            
            if let name = self.name {
                dictionary["name"] = name.asDictionary()
            }
            
            if let hcpType = self.hcpType {
                dictionary["hcpType"] = hcpType.rawValue
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
            
            if let workingHomeId = self.workingHomeId {
                dictionary["workingHomeId"] = workingHomeId
            }
            
            if let workingAtId = self.workingAtId {
                dictionary["workingAtId"] = workingAtId
            }
            
            if let email = self.email {
                dictionary["email"] = email.asDictionary()
            }
            
            if let timeZone = self.timeZone {
                dictionary["timeZone"] = timeZone.rawValue
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ORG_ID
    case EMPTY_HCP_TYPE
    case EMPTY_NAME
    case EMPTY_EMAIL
    case TIME_ZONE_REQUIRED
    case EMAIL_ALREADY_IN_USE
    case ORG_NOT_FOUND
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveHcp.Code?
    var hcpId: String?
    var userId: String?
    var contactId: String?

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
        if let code = WsSaveHcp.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let hcpId = json["hcpId"].string {
        self.hcpId = hcpId
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    if let contactId = json["contactId"].string {
        self.contactId = contactId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let hcpId = self.hcpId {
        dictionary["hcpId"] = hcpId
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let contactId = self.contactId {
        dictionary["contactId"] = contactId
    }
    
    return dictionary
}
}

}
