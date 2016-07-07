import Foundation
import SwiftyJSON

struct WsGetOrgUnit {

    class Request: WsRequest {
        typealias Response = WsGetOrgUnit.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/orgunit/get"
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
    case INVALID_ID
}

class OrgUnitDetail: JSONSerializable {
    var id: String?
    var orgId: String?
    var orgType: OrgType?
    var orgName: String?
    var parentOuId: String?
    var parentOuName: String?
    var parentOuPublicName: String?
    var rootOuId: String?
    var rootOuName: String?
    var rootOuPublicName: String?
    var opsOuId: String?
    var opsOuName: String?
    var opsOuPublicName: String?
    var name: String?
    var publicName: String?
    var email: Email?
    var salesOu: Bool?
    var opsOu: Bool?
    var signUpAllowed: Bool?
    var publicListing: Bool?
    var description: String?
    var label: String?
    var schema: String?
    var bottom: Bool?
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
    
    if let parentOuId = json["parentOuId"].string {
        self.parentOuId = parentOuId
    }
    
    if let parentOuName = json["parentOuName"].string {
        self.parentOuName = parentOuName
    }
    
    if let parentOuPublicName = json["parentOuPublicName"].string {
        self.parentOuPublicName = parentOuPublicName
    }
    
    if let rootOuId = json["rootOuId"].string {
        self.rootOuId = rootOuId
    }
    
    if let rootOuName = json["rootOuName"].string {
        self.rootOuName = rootOuName
    }
    
    if let rootOuPublicName = json["rootOuPublicName"].string {
        self.rootOuPublicName = rootOuPublicName
    }
    
    if let opsOuId = json["opsOuId"].string {
        self.opsOuId = opsOuId
    }
    
    if let opsOuName = json["opsOuName"].string {
        self.opsOuName = opsOuName
    }
    
    if let opsOuPublicName = json["opsOuPublicName"].string {
        self.opsOuPublicName = opsOuPublicName
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let publicName = json["publicName"].string {
        self.publicName = publicName
    }
    
    self.email = Email(json: json["email"])
    
    if let salesOu = json["salesOu"].bool {
        self.salesOu = salesOu
    }
    
    if let opsOu = json["opsOu"].bool {
        self.opsOu = opsOu
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
    
    if let bottom = json["bottom"].bool {
        self.bottom = bottom
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
    
    if let parentOuId = self.parentOuId {
        dictionary["parentOuId"] = parentOuId
    }
    
    if let parentOuName = self.parentOuName {
        dictionary["parentOuName"] = parentOuName
    }
    
    if let parentOuPublicName = self.parentOuPublicName {
        dictionary["parentOuPublicName"] = parentOuPublicName
    }
    
    if let rootOuId = self.rootOuId {
        dictionary["rootOuId"] = rootOuId
    }
    
    if let rootOuName = self.rootOuName {
        dictionary["rootOuName"] = rootOuName
    }
    
    if let rootOuPublicName = self.rootOuPublicName {
        dictionary["rootOuPublicName"] = rootOuPublicName
    }
    
    if let opsOuId = self.opsOuId {
        dictionary["opsOuId"] = opsOuId
    }
    
    if let opsOuName = self.opsOuName {
        dictionary["opsOuName"] = opsOuName
    }
    
    if let opsOuPublicName = self.opsOuPublicName {
        dictionary["opsOuPublicName"] = opsOuPublicName
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let publicName = self.publicName {
        dictionary["publicName"] = publicName
    }
    
    if let email = self.email {
        dictionary["email"] = email.asDictionary()
    }
    
    if let salesOu = self.salesOu {
        dictionary["salesOu"] = salesOu
    }
    
    if let opsOu = self.opsOu {
        dictionary["opsOu"] = opsOu
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
    
    if let bottom = self.bottom {
        dictionary["bottom"] = bottom
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsGetOrgUnit.Code?
    var detail: WsGetOrgUnit.OrgUnitDetail?

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
        if let code = WsGetOrgUnit.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetOrgUnit.OrgUnitDetail(json: json["detail"])
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
