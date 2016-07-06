import Foundation
import GRDBCipher
import SwiftyJSON

class LoanEntity: AbstractEntity {
    var organizationId: String?
    var bizUnitId: String?
    var opsOrgUnitId: String?
    var salesOrgUnitId: String?
    var loanNumber: Int?
    var loanStatus: LoanStatus?
    var loanState: LoanState?
    var stateChanged: Int?
    var loanOrderId: String?
    var reason: LoanReason?
    var serviceStartDate: Int?
    var serviceEndDate: Int?
    var expirationDate: Int?
    var itemClass: ItemClass?
    var locationType: LocationType?
    var locationId: String?

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
    
    if let loanNumber = json["loanNumber"].int {
        self.loanNumber = loanNumber
    }
    
    if let loanStatusStringValue = json["loanStatus"].string {
        if let loanStatus = LoanStatus(rawValue: loanStatusStringValue) {
            self.loanStatus = loanStatus
        }
    }
    
    if let loanStateStringValue = json["loanState"].string {
        if let loanState = LoanState(rawValue: loanStateStringValue) {
            self.loanState = loanState
        }
    }
    
    if let loanOrderId = json["loanOrderId"].string {
        self.loanOrderId = loanOrderId
    }
    
    if let reasonStringValue = json["reason"].string {
        if let reason = LoanReason(rawValue: reasonStringValue) {
            self.reason = reason
        }
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let locationTypeStringValue = json["locationType"].string {
        if let locationType = LocationType(rawValue: locationTypeStringValue) {
            self.locationType = locationType
        }
    }
    
    if let locationId = json["locationId"].string {
        self.locationId = locationId
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
    
    if let loanNumber = self.loanNumber {
        dictionary["loanNumber"] = loanNumber
    }
    
    if let loanStatus = self.loanStatus {
        dictionary["loanStatus"] = loanStatus.rawValue
    }
    
    if let loanState = self.loanState {
        dictionary["loanState"] = loanState.rawValue
    }
    
    if let loanOrderId = self.loanOrderId {
        dictionary["loanOrderId"] = loanOrderId
    }
    
    if let reason = self.reason {
        dictionary["reason"] = reason.rawValue
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let locationType = self.locationType {
        dictionary["locationType"] = locationType.rawValue
    }
    
    if let locationId = self.locationId {
        dictionary["locationId"] = locationId
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
