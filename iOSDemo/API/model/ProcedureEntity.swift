import Foundation
import GRDBCipher
import SwiftyJSON

class ProcedureEntity: AbstractEntity {
    var name: String?
    var orgId: String?
    var icdCode: String?
    var bodySideRequired: Bool?
    var active: Bool?
    var description: String?

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
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let icdCode = json["icdCode"].string {
        self.icdCode = icdCode
    }
    
    if let bodySideRequired = json["bodySideRequired"].bool {
        self.bodySideRequired = bodySideRequired
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
    
    if let description = json["description"].string {
        self.description = description
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let icdCode = self.icdCode {
        dictionary["icdCode"] = icdCode
    }
    
    if let bodySideRequired = self.bodySideRequired {
        dictionary["bodySideRequired"] = bodySideRequired
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    if let description = self.description {
        dictionary["description"] = description
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
