import Foundation
import GRDBCipher
import SwiftyJSON

class ItemCategoryEntity: AbstractEntity {
    var organizationId: String?
    var bizUnitId: String?
    var opsOrgUnitId: String?
    var parentCategoryId: String?
    var name: String?
    var code: String?
    var bottom: Bool?

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
    
    if let organizationId = json["organizationId"].string {
        self.organizationId = organizationId
    }
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let opsOrgUnitId = json["opsOrgUnitId"].string {
        self.opsOrgUnitId = opsOrgUnitId
    }
    
    if let parentCategoryId = json["parentCategoryId"].string {
        self.parentCategoryId = parentCategoryId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let code = json["code"].string {
        self.code = code
    }
    
    if let bottom = json["bottom"].bool {
        self.bottom = bottom
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let organizationId = self.organizationId {
        dictionary["organizationId"] = organizationId
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let opsOrgUnitId = self.opsOrgUnitId {
        dictionary["opsOrgUnitId"] = opsOrgUnitId
    }
    
    if let parentCategoryId = self.parentCategoryId {
        dictionary["parentCategoryId"] = parentCategoryId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let code = self.code {
        dictionary["code"] = code
    }
    
    if let bottom = self.bottom {
        dictionary["bottom"] = bottom
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
