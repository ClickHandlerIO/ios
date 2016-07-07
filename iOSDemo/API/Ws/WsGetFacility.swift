import Foundation
import SwiftyJSON

struct WsGetFacility {

    class Request: WsRequest {
        typealias Response = WsGetFacility.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/facility/get"
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
    var code: WsGetFacility.Code?
    var detail: WsGetFacility.FacilityDetail?

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
        if let code = WsGetFacility.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetFacility.FacilityDetail(json: json["detail"])
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

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case NOT_FOUND
    case FAILED
}

class FacilityDetail: JSONSerializable {
    var id: String?
    var orgId: String?
    var orgType: OrgType?
    var orgName: String?
    var facilityType: FacilityType?
    var name: String?
    var email: Email?
    var address: Address?
    var timeZone: TZ?
    var caseLoaningMethodology: CaseLoaningMethodology?
    var restockType: RestockType?
    var binManaged: Bool?
    var autoPutAway: Bool?
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
    
    if let facilityTypeStringValue = json["facilityType"].string {
        if let facilityType = FacilityType(rawValue: facilityTypeStringValue) {
            self.facilityType = facilityType
        }
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    self.email = Email(json: json["email"])
    
    self.address = Address(json: json["address"])
    
    if let timeZoneStringValue = json["timeZone"].string {
        if let timeZone = TZ(rawValue: timeZoneStringValue) {
            self.timeZone = timeZone
        }
    }
    
    if let caseLoaningMethodologyStringValue = json["caseLoaningMethodology"].string {
        if let caseLoaningMethodology = CaseLoaningMethodology(rawValue: caseLoaningMethodologyStringValue) {
            self.caseLoaningMethodology = caseLoaningMethodology
        }
    }
    
    if let restockTypeStringValue = json["restockType"].string {
        if let restockType = RestockType(rawValue: restockTypeStringValue) {
            self.restockType = restockType
        }
    }
    
    if let binManaged = json["binManaged"].bool {
        self.binManaged = binManaged
    }
    
    if let autoPutAway = json["autoPutAway"].bool {
        self.autoPutAway = autoPutAway
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
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let orgName = self.orgName {
        dictionary["orgName"] = orgName
    }
    
    if let facilityType = self.facilityType {
        dictionary["facilityType"] = facilityType.rawValue
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let email = self.email {
        dictionary["email"] = email.asDictionary()
    }
    
    if let address = self.address {
        dictionary["address"] = address.asDictionary()
    }
    
    if let timeZone = self.timeZone {
        dictionary["timeZone"] = timeZone.rawValue
    }
    
    if let caseLoaningMethodology = self.caseLoaningMethodology {
        dictionary["caseLoaningMethodology"] = caseLoaningMethodology.rawValue
    }
    
    if let restockType = self.restockType {
        dictionary["restockType"] = restockType.rawValue
    }
    
    if let binManaged = self.binManaged {
        dictionary["binManaged"] = binManaged
    }
    
    if let autoPutAway = self.autoPutAway {
        dictionary["autoPutAway"] = autoPutAway
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    return dictionary
}
}

}
