import Foundation
import SwiftyJSON

struct WsSaveFacility {

    class Request: WsRequest {
        typealias Response = WsSaveFacility.Response
        
        var id: String?
        var orgId: String?
        var orgType: OrgType?
        var name: String?
        var email: Email?
        var address: Address?
        var timeZone: TZ?
        var active: Bool?
        var publicVisible: Bool?
        var facilityType: FacilityType?
        var caseLoaningMethodology: CaseLoaningMethodology?
        var restockType: RestockType?
        var binManaged: Bool?
        var autoPutAway: Bool?
        
        class func getPath() -> String {
            return "/dir/facility/save"
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
            
            if let orgTypeStringValue = json["orgType"].string {
                if let orgType = OrgType(rawValue: orgTypeStringValue) {
                    self.orgType = orgType
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
            
            if let active = json["active"].bool {
                self.active = active
            }
            
            if let publicVisible = json["publicVisible"].bool {
                self.publicVisible = publicVisible
            }
            
            if let facilityTypeStringValue = json["facilityType"].string {
                if let facilityType = FacilityType(rawValue: facilityTypeStringValue) {
                    self.facilityType = facilityType
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
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            if let publicVisible = self.publicVisible {
                dictionary["publicVisible"] = publicVisible
            }
            
            if let facilityType = self.facilityType {
                dictionary["facilityType"] = facilityType.rawValue
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
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ORG_ID
    case EMPTY_ORG_TYPE
    case NAME_REQUIRED
    case EMAIL_REQUIRED
    case ADDRESS_REQUIRED
    case TIMEZONE_REQUIRED
    case FACILITY_TYPE_REQUIRED
    case CASE_LOANING_METHOD_REQUIRED
    case RESTOCK_TYPE_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveFacility.Code?
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
        if let code = WsSaveFacility.Code(rawValue: codeStringValue) {
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
