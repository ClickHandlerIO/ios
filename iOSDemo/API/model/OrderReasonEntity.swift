import Foundation
import GRDBCipher
import SwiftyJSON

class OrderReasonEntity: AbstractEntity {
    var organizationId: String?
    var bizUnitId: String?
    var opsOrgUnitId: String?
    var salesOrgUnitId: String?
    var name: String?
    var reasonGroup: OrderReasonGroup?
    var erp: Bool?

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
    
    if let salesOrgUnitId = json["salesOrgUnitId"].string {
        self.salesOrgUnitId = salesOrgUnitId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let reasonGroupStringValue = json["reasonGroup"].string {
        if let reasonGroup = OrderReasonGroup(rawValue: reasonGroupStringValue) {
            self.reasonGroup = reasonGroup
        }
    }
    
    if let erp = json["erp"].bool {
        self.erp = erp
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
    
    if let salesOrgUnitId = self.salesOrgUnitId {
        dictionary["salesOrgUnitId"] = salesOrgUnitId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let reasonGroup = self.reasonGroup {
        dictionary["reasonGroup"] = reasonGroup.rawValue
    }
    
    if let erp = self.erp {
        dictionary["erp"] = erp
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
