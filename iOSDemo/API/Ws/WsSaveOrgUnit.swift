import Foundation
import SwiftyJSON

struct WsSaveOrgUnit {

    class Request: WsRequest {
        typealias Response = WsSaveOrgUnit.Response
        
        var id: String?
        var orgId: String?
        var parentId: String?
        var name: String?
        var email: Email?
        var publicName: String?
        var salesOrgUnit: Bool?
        var opsOrgUnit: Bool?
        var opsOrgUnitId: String?
        var signUpAllowed: Bool?
        var publicListing: Bool?
        var description: String?
        var label: String?
        var schema: String?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/orgunit/save"
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
            
            if let parentId = json["parentId"].string {
                self.parentId = parentId
            }
            
            if let name = json["name"].string {
                self.name = name
            }
            
            self.email = Email(json: json["email"])
            
            if let publicName = json["publicName"].string {
                self.publicName = publicName
            }
            
            if let salesOrgUnit = json["salesOrgUnit"].bool {
                self.salesOrgUnit = salesOrgUnit
            }
            
            if let opsOrgUnit = json["opsOrgUnit"].bool {
                self.opsOrgUnit = opsOrgUnit
            }
            
            if let opsOrgUnitId = json["opsOrgUnitId"].string {
                self.opsOrgUnitId = opsOrgUnitId
            }
            
            if let signUpAllowed = json["signUpAllowed"].bool {
                self.signUpAllowed = signUpAllowed
            }
            
            if let publicListing = json["publicListing"].bool {
                self.publicListing = publicListing
            }
            
            if let description = json["description"].string {
                self.description = description
            }
            
            if let label = json["label"].string {
                self.label = label
            }
            
            if let schema = json["schema"].string {
                self.schema = schema
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
            
            if let parentId = self.parentId {
                dictionary["parentId"] = parentId
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let email = self.email {
                dictionary["email"] = email.asDictionary()
            }
            
            if let publicName = self.publicName {
                dictionary["publicName"] = publicName
            }
            
            if let salesOrgUnit = self.salesOrgUnit {
                dictionary["salesOrgUnit"] = salesOrgUnit
            }
            
            if let opsOrgUnit = self.opsOrgUnit {
                dictionary["opsOrgUnit"] = opsOrgUnit
            }
            
            if let opsOrgUnitId = self.opsOrgUnitId {
                dictionary["opsOrgUnitId"] = opsOrgUnitId
            }
            
            if let signUpAllowed = self.signUpAllowed {
                dictionary["signUpAllowed"] = signUpAllowed
            }
            
            if let publicListing = self.publicListing {
                dictionary["publicListing"] = publicListing
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            if let label = self.label {
                dictionary["label"] = label
            }
            
            if let schema = self.schema {
                dictionary["schema"] = schema
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsSaveOrgUnit.Code?
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
        if let code = WsSaveOrgUnit.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case FAILED
    case INVALID_ORG_ID
    case NAME_REQUIRED
    case INVALID_PARENT_ID
    case NOT_FOUND
    case TYPE_REQUIRED
    case EMAIL_REQUIRED
    case ORG_TYPE_REQUIRED
    case OPS_OU_ID_REQUIRED
    case PARENT_NOT_FOUND
    case ORG_NOT_FOUND
    case CONTACT_NOT_FOUND
}

}
