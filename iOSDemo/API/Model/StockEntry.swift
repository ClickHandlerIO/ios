import Foundation
import SwiftyJSON

class StockEntry: JSONSerializable {
    var bizUnitId: String?
    var inventoryTypeId: String?
    var itemId: String?
    var itemVersionId: String?
    var linkedToSetItemId: String?
    var linkedToSetVersionId: String?
    var lotId: String?
    var serialId: String?
    var tagId: String?
    var homeLocationType: LocationType?
    var homeLocationId: String?
    var locationType: LocationType?
    var locationId: String?
    var containerType: StockContainerType?
    var containerId: String?
    var rootContainerType: StockContainerType?
    var rootContainerId: String?
    var stockStatus: StockStatus?
    var quantity: Int?

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
    
    if let linkedToSetItemId = json["linkedToSetItemId"].string {
        self.linkedToSetItemId = linkedToSetItemId
    }
    
    if let linkedToSetVersionId = json["linkedToSetVersionId"].string {
        self.linkedToSetVersionId = linkedToSetVersionId
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
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
    
    if let stockStatusStringValue = json["stockStatus"].string {
        if let stockStatus = StockStatus(rawValue: stockStatusStringValue) {
            self.stockStatus = stockStatus
        }
    }
    
    if let quantity = json["quantity"].int {
        self.quantity = quantity
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
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
    
    if let linkedToSetItemId = self.linkedToSetItemId {
        dictionary["linkedToSetItemId"] = linkedToSetItemId
    }
    
    if let linkedToSetVersionId = self.linkedToSetVersionId {
        dictionary["linkedToSetVersionId"] = linkedToSetVersionId
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
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
    
    if let stockStatus = self.stockStatus {
        dictionary["stockStatus"] = stockStatus.rawValue
    }
    
    if let quantity = self.quantity {
        dictionary["quantity"] = quantity
    }
    
    return dictionary
}
}
