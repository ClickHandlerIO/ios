import Foundation
import GRDBCipher
import SwiftyJSON

class StockEntity: AbstractEntity {
    var organizationId: String?
    var bizUnitId: String?
    var inventoryTypeId: String?
    var itemId: String?
    var itemVersionId: String?
    var serialId: String?
    var lotId: String?
    var tagId: String?
    var homeLocationType: LocationType?
    var homeLocationId: String?
    var locationType: LocationType?
    var locationId: String?
    var fromLocationType: LocationType?
    var fromLocationId: String?
    var toLocationType: LocationType?
    var toLocationId: String?
    var dueBackToOrgUnitId: String?
    var dueBackToLocationType: LocationType?
    var dueBackToLocationId: String?
    var dueBackDate: Int?
    var containerType: StockContainerType?
    var containerId: String?
    var rootContainerType: StockContainerType?
    var rootContainerId: String?
    var linkedToSetItemId: String?
    var linkedToSetVersionId: String?
    var stockStatus: StockStatus?
    var stockState: StockState?
    var stateChanged: Int?
    var valid: Bool?
    var loanId: String?
    var orderLineId: String?
    var pickId: String?
    var soonestExpirationDate: Int?
    var lostReason: LostReason?
    var lostReasonId: String?
    var foundReason: FoundReason?
    var foundReasonId: String?

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
    
    if let inventoryTypeId = json["inventoryTypeId"].string {
        self.inventoryTypeId = inventoryTypeId
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let tagId = json["tagId"].string {
        self.tagId = tagId
    }
    
    if let homeLocationTypeStringValue = json["homeLocationType"].string {
        if let homeLocationType = LocationType(rawValue: homeLocationTypeStringValue) {
            self.homeLocationType = homeLocationType
        }
    }
    
    if let homeLocationId = json["homeLocationId"].string {
        self.homeLocationId = homeLocationId
    }
    
    if let locationTypeStringValue = json["locationType"].string {
        if let locationType = LocationType(rawValue: locationTypeStringValue) {
            self.locationType = locationType
        }
    }
    
    if let locationId = json["locationId"].string {
        self.locationId = locationId
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
    
    if let dueBackToOrgUnitId = json["dueBackToOrgUnitId"].string {
        self.dueBackToOrgUnitId = dueBackToOrgUnitId
    }
    
    if let dueBackToLocationTypeStringValue = json["dueBackToLocationType"].string {
        if let dueBackToLocationType = LocationType(rawValue: dueBackToLocationTypeStringValue) {
            self.dueBackToLocationType = dueBackToLocationType
        }
    }
    
    if let dueBackToLocationId = json["dueBackToLocationId"].string {
        self.dueBackToLocationId = dueBackToLocationId
    }
    
    if let containerTypeStringValue = json["containerType"].string {
        if let containerType = StockContainerType(rawValue: containerTypeStringValue) {
            self.containerType = containerType
        }
    }
    
    if let containerId = json["containerId"].string {
        self.containerId = containerId
    }
    
    if let rootContainerTypeStringValue = json["rootContainerType"].string {
        if let rootContainerType = StockContainerType(rawValue: rootContainerTypeStringValue) {
            self.rootContainerType = rootContainerType
        }
    }
    
    if let rootContainerId = json["rootContainerId"].string {
        self.rootContainerId = rootContainerId
    }
    
    if let linkedToSetItemId = json["linkedToSetItemId"].string {
        self.linkedToSetItemId = linkedToSetItemId
    }
    
    if let linkedToSetVersionId = json["linkedToSetVersionId"].string {
        self.linkedToSetVersionId = linkedToSetVersionId
    }
    
    if let stockStatusStringValue = json["stockStatus"].string {
        if let stockStatus = StockStatus(rawValue: stockStatusStringValue) {
            self.stockStatus = stockStatus
        }
    }
    
    if let stockStateStringValue = json["stockState"].string {
        if let stockState = StockState(rawValue: stockStateStringValue) {
            self.stockState = stockState
        }
    }
    
    if let valid = json["valid"].bool {
        self.valid = valid
    }
    
    if let loanId = json["loanId"].string {
        self.loanId = loanId
    }
    
    if let orderLineId = json["orderLineId"].string {
        self.orderLineId = orderLineId
    }
    
    if let pickId = json["pickId"].string {
        self.pickId = pickId
    }
    
    if let lostReasonStringValue = json["lostReason"].string {
        if let lostReason = LostReason(rawValue: lostReasonStringValue) {
            self.lostReason = lostReason
        }
    }
    
    if let lostReasonId = json["lostReasonId"].string {
        self.lostReasonId = lostReasonId
    }
    
    if let foundReasonStringValue = json["foundReason"].string {
        if let foundReason = FoundReason(rawValue: foundReasonStringValue) {
            self.foundReason = foundReason
        }
    }
    
    if let foundReasonId = json["foundReasonId"].string {
        self.foundReasonId = foundReasonId
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
    
    if let inventoryTypeId = self.inventoryTypeId {
        dictionary["inventoryTypeId"] = inventoryTypeId
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let tagId = self.tagId {
        dictionary["tagId"] = tagId
    }
    
    if let homeLocationType = self.homeLocationType {
        dictionary["homeLocationType"] = homeLocationType.rawValue
    }
    
    if let homeLocationId = self.homeLocationId {
        dictionary["homeLocationId"] = homeLocationId
    }
    
    if let locationType = self.locationType {
        dictionary["locationType"] = locationType.rawValue
    }
    
    if let locationId = self.locationId {
        dictionary["locationId"] = locationId
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
    
    if let dueBackToOrgUnitId = self.dueBackToOrgUnitId {
        dictionary["dueBackToOrgUnitId"] = dueBackToOrgUnitId
    }
    
    if let dueBackToLocationType = self.dueBackToLocationType {
        dictionary["dueBackToLocationType"] = dueBackToLocationType.rawValue
    }
    
    if let dueBackToLocationId = self.dueBackToLocationId {
        dictionary["dueBackToLocationId"] = dueBackToLocationId
    }
    
    if let containerType = self.containerType {
        dictionary["containerType"] = containerType.rawValue
    }
    
    if let containerId = self.containerId {
        dictionary["containerId"] = containerId
    }
    
    if let rootContainerType = self.rootContainerType {
        dictionary["rootContainerType"] = rootContainerType.rawValue
    }
    
    if let rootContainerId = self.rootContainerId {
        dictionary["rootContainerId"] = rootContainerId
    }
    
    if let linkedToSetItemId = self.linkedToSetItemId {
        dictionary["linkedToSetItemId"] = linkedToSetItemId
    }
    
    if let linkedToSetVersionId = self.linkedToSetVersionId {
        dictionary["linkedToSetVersionId"] = linkedToSetVersionId
    }
    
    if let stockStatus = self.stockStatus {
        dictionary["stockStatus"] = stockStatus.rawValue
    }
    
    if let stockState = self.stockState {
        dictionary["stockState"] = stockState.rawValue
    }
    
    if let valid = self.valid {
        dictionary["valid"] = valid
    }
    
    if let loanId = self.loanId {
        dictionary["loanId"] = loanId
    }
    
    if let orderLineId = self.orderLineId {
        dictionary["orderLineId"] = orderLineId
    }
    
    if let pickId = self.pickId {
        dictionary["pickId"] = pickId
    }
    
    if let lostReason = self.lostReason {
        dictionary["lostReason"] = lostReason.rawValue
    }
    
    if let lostReasonId = self.lostReasonId {
        dictionary["lostReasonId"] = lostReasonId
    }
    
    if let foundReason = self.foundReason {
        dictionary["foundReason"] = foundReason.rawValue
    }
    
    if let foundReasonId = self.foundReasonId {
        dictionary["foundReasonId"] = foundReasonId
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
