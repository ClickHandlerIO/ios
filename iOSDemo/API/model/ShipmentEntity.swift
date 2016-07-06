import Foundation
import GRDBCipher
import SwiftyJSON

class ShipmentEntity: AbstractEntity {
    var version: Int?
    var orderId: String?
    var shipmentReference: String?
    var shipmentNumber: Int?
    var shipmentStatus: ShipmentStatus?
    var shipmentState: ShipmentState?
    var stateChanged: Int?
    var fromLocationType: LocationType?
    var fromLocationId: String?
    var toLocationType: LocationType?
    var toLocationId: String?
    var releaseDate: Int?

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
    
    if let version = json["version"].int {
        self.version = version
    }
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let shipmentReference = json["shipmentReference"].string {
        self.shipmentReference = shipmentReference
    }
    
    if let shipmentNumber = json["shipmentNumber"].int {
        self.shipmentNumber = shipmentNumber
    }
    
    if let shipmentStatusStringValue = json["shipmentStatus"].string {
        if let shipmentStatus = ShipmentStatus(rawValue: shipmentStatusStringValue) {
            self.shipmentStatus = shipmentStatus
        }
    }
    
    if let shipmentStateStringValue = json["shipmentState"].string {
        if let shipmentState = ShipmentState(rawValue: shipmentStateStringValue) {
            self.shipmentState = shipmentState
        }
    }
    
    if let fromLocationTypeStringValue = json["fromLocationType"].string {
        if let fromLocationType = LocationType(rawValue: fromLocationTypeStringValue) {
            self.fromLocationType = fromLocationType
        }
    }
    
    if let fromLocationId = json["fromLocationId"].string {
        self.fromLocationId = fromLocationId
    }
    
    if let toLocationTypeStringValue = json["toLocationType"].string {
        if let toLocationType = LocationType(rawValue: toLocationTypeStringValue) {
            self.toLocationType = toLocationType
        }
    }
    
    if let toLocationId = json["toLocationId"].string {
        self.toLocationId = toLocationId
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let version = self.version {
        dictionary["version"] = version
    }
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let shipmentReference = self.shipmentReference {
        dictionary["shipmentReference"] = shipmentReference
    }
    
    if let shipmentNumber = self.shipmentNumber {
        dictionary["shipmentNumber"] = shipmentNumber
    }
    
    if let shipmentStatus = self.shipmentStatus {
        dictionary["shipmentStatus"] = shipmentStatus.rawValue
    }
    
    if let shipmentState = self.shipmentState {
        dictionary["shipmentState"] = shipmentState.rawValue
    }
    
    if let fromLocationType = self.fromLocationType {
        dictionary["fromLocationType"] = fromLocationType.rawValue
    }
    
    if let fromLocationId = self.fromLocationId {
        dictionary["fromLocationId"] = fromLocationId
    }
    
    if let toLocationType = self.toLocationType {
        dictionary["toLocationType"] = toLocationType.rawValue
    }
    
    if let toLocationId = self.toLocationId {
        dictionary["toLocationId"] = toLocationId
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
