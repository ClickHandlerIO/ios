import Foundation
import GRDBCipher
import SwiftyJSON

class PackageEntity: AbstractEntity {
    var organizationId: String?
    var bizUnitId: String?
    var orderId: String?
    var shipmentId: String?
    var packageNumber: Int?
    var packageReference: String?
    var trackingNumber: String?
    var packageStatus: PackageStatus?
    var packageState: PackageState?
    var stateChanged: Int?
    var parentContainerType: StockContainerType?
    var parentContainerId: String?

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
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let shipmentId = json["shipmentId"].string {
        self.shipmentId = shipmentId
    }
    
    if let packageNumber = json["packageNumber"].int {
        self.packageNumber = packageNumber
    }
    
    if let packageReference = json["packageReference"].string {
        self.packageReference = packageReference
    }
    
    if let trackingNumber = json["trackingNumber"].string {
        self.trackingNumber = trackingNumber
    }
    
    if let packageStatusStringValue = json["packageStatus"].string {
        if let packageStatus = PackageStatus(rawValue: packageStatusStringValue) {
            self.packageStatus = packageStatus
        }
    }
    
    if let packageStateStringValue = json["packageState"].string {
        if let packageState = PackageState(rawValue: packageStateStringValue) {
            self.packageState = packageState
        }
    }
    
    if let parentContainerTypeStringValue = json["parentContainerType"].string {
        if let parentContainerType = StockContainerType(rawValue: parentContainerTypeStringValue) {
            self.parentContainerType = parentContainerType
        }
    }
    
    if let parentContainerId = json["parentContainerId"].string {
        self.parentContainerId = parentContainerId
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
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let shipmentId = self.shipmentId {
        dictionary["shipmentId"] = shipmentId
    }
    
    if let packageNumber = self.packageNumber {
        dictionary["packageNumber"] = packageNumber
    }
    
    if let packageReference = self.packageReference {
        dictionary["packageReference"] = packageReference
    }
    
    if let trackingNumber = self.trackingNumber {
        dictionary["trackingNumber"] = trackingNumber
    }
    
    if let packageStatus = self.packageStatus {
        dictionary["packageStatus"] = packageStatus.rawValue
    }
    
    if let packageState = self.packageState {
        dictionary["packageState"] = packageState.rawValue
    }
    
    if let parentContainerType = self.parentContainerType {
        dictionary["parentContainerType"] = parentContainerType.rawValue
    }
    
    if let parentContainerId = self.parentContainerId {
        dictionary["parentContainerId"] = parentContainerId
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
