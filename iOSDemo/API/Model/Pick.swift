import Foundation
import SwiftyJSON

class Pick: JSONSerializable {
    var id: String?
    var pickNumber: String?
    var sourcedStockId: String?
    var pickedStockId: String?
    var itemLongDesc: String?
    var itemShortDesc: String?
    var itemNumber: String?
    var lotNumber: String?
    var serialNumber: Int?
    var fromLocationType: LocationType?
    var fromLocationId: String?
    var fromLocation: Location?
    var toLocationType: LocationType?
    var toLocationId: String?
    var toLocation: Location?
    var fromContainerType: StockContainerType?
    var fromContainerId: String?
    var fromContainer: Container?
    var toContainerType: StockContainerType?
    var toContainerId: String?
    var toContainer: Container?
    var releaseDate: Int?
    var createdDate: Int?
    var releasedDate: Int?
    var inProgressDate: Int?
    var pickedDate: Int?
    var completedDate: Int?
    var assignedDate: Int?
    var assignedUserId: String?
    var assignedUsersName: String?
    var userEntity: UserEntity?
    var systemAdminEntity: SystemAdminEntity?
    var aeEntity: AeEntity?
    var hcpEntity: HcpEntity?
    var hcrEntity: HcrEntity?
    var dceEntity: DceEntity?

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
    
    if let pickNumber = json["pickNumber"].string {
        self.pickNumber = pickNumber
    }
    
    if let sourcedStockId = json["sourcedStockId"].string {
        self.sourcedStockId = sourcedStockId
    }
    
    if let pickedStockId = json["pickedStockId"].string {
        self.pickedStockId = pickedStockId
    }
    
    if let itemLongDesc = json["itemLongDesc"].string {
        self.itemLongDesc = itemLongDesc
    }
    
    if let itemShortDesc = json["itemShortDesc"].string {
        self.itemShortDesc = itemShortDesc
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialNumber = json["serialNumber"].int {
        self.serialNumber = serialNumber
    }
    
    if let fromLocationTypeStringValue = json["fromLocationType"].string {
        if let fromLocationType = LocationType(rawValue: fromLocationTypeStringValue) {
            self.fromLocationType = fromLocationType
        }
    }
    
    if let fromLocationId = json["fromLocationId"].string {
        self.fromLocationId = fromLocationId
    }
    
    self.fromLocation = Location(json: json["fromLocation"])
    
    if let toLocationTypeStringValue = json["toLocationType"].string {
        if let toLocationType = LocationType(rawValue: toLocationTypeStringValue) {
            self.toLocationType = toLocationType
        }
    }
    
    if let toLocationId = json["toLocationId"].string {
        self.toLocationId = toLocationId
    }
    
    self.toLocation = Location(json: json["toLocation"])
    
    if let fromContainerTypeStringValue = json["fromContainerType"].string {
        if let fromContainerType = StockContainerType(rawValue: fromContainerTypeStringValue) {
            self.fromContainerType = fromContainerType
        }
    }
    
    if let fromContainerId = json["fromContainerId"].string {
        self.fromContainerId = fromContainerId
    }
    
    self.fromContainer = Container(json: json["fromContainer"])
    
    if let toContainerTypeStringValue = json["toContainerType"].string {
        if let toContainerType = StockContainerType(rawValue: toContainerTypeStringValue) {
            self.toContainerType = toContainerType
        }
    }
    
    if let toContainerId = json["toContainerId"].string {
        self.toContainerId = toContainerId
    }
    
    self.toContainer = Container(json: json["toContainer"])
    
    if let assignedUserId = json["assignedUserId"].string {
        self.assignedUserId = assignedUserId
    }
    
    if let assignedUsersName = json["assignedUsersName"].string {
        self.assignedUsersName = assignedUsersName
    }
    
    self.userEntity = UserEntity(json: json["userEntity"])
    
    self.systemAdminEntity = SystemAdminEntity(json: json["systemAdminEntity"])
    
    self.aeEntity = AeEntity(json: json["aeEntity"])
    
    self.hcpEntity = HcpEntity(json: json["hcpEntity"])
    
    self.hcrEntity = HcrEntity(json: json["hcrEntity"])
    
    self.dceEntity = DceEntity(json: json["dceEntity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let pickNumber = self.pickNumber {
        dictionary["pickNumber"] = pickNumber
    }
    
    if let sourcedStockId = self.sourcedStockId {
        dictionary["sourcedStockId"] = sourcedStockId
    }
    
    if let pickedStockId = self.pickedStockId {
        dictionary["pickedStockId"] = pickedStockId
    }
    
    if let itemLongDesc = self.itemLongDesc {
        dictionary["itemLongDesc"] = itemLongDesc
    }
    
    if let itemShortDesc = self.itemShortDesc {
        dictionary["itemShortDesc"] = itemShortDesc
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let fromLocationType = self.fromLocationType {
        dictionary["fromLocationType"] = fromLocationType.rawValue
    }
    
    if let fromLocationId = self.fromLocationId {
        dictionary["fromLocationId"] = fromLocationId
    }
    
    if let fromLocation = self.fromLocation {
        dictionary["fromLocation"] = fromLocation.asDictionary()
    }
    
    if let toLocationType = self.toLocationType {
        dictionary["toLocationType"] = toLocationType.rawValue
    }
    
    if let toLocationId = self.toLocationId {
        dictionary["toLocationId"] = toLocationId
    }
    
    if let toLocation = self.toLocation {
        dictionary["toLocation"] = toLocation.asDictionary()
    }
    
    if let fromContainerType = self.fromContainerType {
        dictionary["fromContainerType"] = fromContainerType.rawValue
    }
    
    if let fromContainerId = self.fromContainerId {
        dictionary["fromContainerId"] = fromContainerId
    }
    
    if let fromContainer = self.fromContainer {
        dictionary["fromContainer"] = fromContainer.asDictionary()
    }
    
    if let toContainerType = self.toContainerType {
        dictionary["toContainerType"] = toContainerType.rawValue
    }
    
    if let toContainerId = self.toContainerId {
        dictionary["toContainerId"] = toContainerId
    }
    
    if let toContainer = self.toContainer {
        dictionary["toContainer"] = toContainer.asDictionary()
    }
    
    if let assignedUserId = self.assignedUserId {
        dictionary["assignedUserId"] = assignedUserId
    }
    
    if let assignedUsersName = self.assignedUsersName {
        dictionary["assignedUsersName"] = assignedUsersName
    }
    
    if let userEntity = self.userEntity {
        dictionary["userEntity"] = userEntity.asDictionary()
    }
    
    if let systemAdminEntity = self.systemAdminEntity {
        dictionary["systemAdminEntity"] = systemAdminEntity.asDictionary()
    }
    
    if let aeEntity = self.aeEntity {
        dictionary["aeEntity"] = aeEntity.asDictionary()
    }
    
    if let hcpEntity = self.hcpEntity {
        dictionary["hcpEntity"] = hcpEntity.asDictionary()
    }
    
    if let hcrEntity = self.hcrEntity {
        dictionary["hcrEntity"] = hcrEntity.asDictionary()
    }
    
    if let dceEntity = self.dceEntity {
        dictionary["dceEntity"] = dceEntity.asDictionary()
    }
    
    return dictionary
}
}
