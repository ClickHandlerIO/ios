import Foundation
import GRDBCipher
import SwiftyJSON

class OrgUnitEntity: AbstractEntity {
    var orgId: String?
    var parentId: String?
    var rootOrgUnitId: String?
    var name: String?
    var salesOrgUnit: Bool?
    var opsOrgUnit: Bool?
    var opsOrgUnitId: String?
    var publicName: String?
    var signUpAllowed: Bool?
    var publicListing: Bool?
    var description: String?
    var label: String?
    var bottom: Bool?
    var schema: String?
    var active: Bool?

// JSON

required init() {
    super.init()
}

convenience required init?(json: JSON?) {
    guard let json = json else {
        return nil
    }
    self.init()
    self.merge(json)
}

override func merge(json: JSON?) {
    guard let json = json else {
        return
    }
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let parentId = json["parentId"].string {
        self.parentId = parentId
    }
    
    if let rootOrgUnitId = json["rootOrgUnitId"].string {
        self.rootOrgUnitId = rootOrgUnitId
    }
    
    if let name = json["name"].string {
        self.name = name
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
    
    if let publicName = json["publicName"].string {
        self.publicName = publicName
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
    
    if let bottom = json["bottom"].bool {
        self.bottom = bottom
    }
    
    if let schema = json["schema"].string {
        self.schema = schema
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let parentId = self.parentId {
        dictionary["parentId"] = parentId
    }
    
    if let rootOrgUnitId = self.rootOrgUnitId {
        dictionary["rootOrgUnitId"] = rootOrgUnitId
    }
    
    if let name = self.name {
        dictionary["name"] = name
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
    
    if let publicName = self.publicName {
        dictionary["publicName"] = publicName
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
    
    if let bottom = self.bottom {
        dictionary["bottom"] = bottom
    }
    
    if let schema = self.schema {
        dictionary["schema"] = schema
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    return dictionary
}

// SQL

override class func databaseTableCreateSql() -> String {
    return ""
}

required init(_ row: Row) {
    super.init(row)
}

override var persistentDictionary: [String:DatabaseValueConvertible?] {
    return [:]
}
}
