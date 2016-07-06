import Foundation
import GRDBCipher
import SwiftyJSON

class BizUnitEntity: AbstractEntity {
    var orgType: OrgType?
    var orgId: String?
    var name: String?
    var description: String?
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
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let description = json["description"].string {
        self.description = description
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let description = self.description {
        dictionary["description"] = description
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
