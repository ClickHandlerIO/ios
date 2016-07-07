import Foundation
import SwiftyJSON

struct WsListPicks {

    class Request: WsRequest {
        typealias Response = WsListPicks.Response
        
        var opsOrgUnitIds: [String]?
        var salesOrgUnitIds: [String]?
        var anyOrgUnitIds: [String]?
        var orderIds: [String]?
        var orderLineIds: [String]?
        var shipmentIds: [String]?
        var fromLocationTypes: [LocationType]?
        var fromLocationIds: [String]?
        var toLocationTypes: [LocationType]?
        var toLocationIds: [String]?
        var anyLocationTypes: [LocationType]?
        var anyLocationIds: [String]?
        var fromContainerTypes: [StockContainerType]?
        var fromContainerIds: [String]?
        var toContainerTypes: [StockContainerType]?
        var toContainerIds: [String]?
        var anyContainerTypes: [StockContainerType]?
        var anyContainerIds: [String]?
        var itemTypes: [ItemType]?
        var itemClasses: [ItemClass]?
        var itemIds: [String]?
        var assignedToUserIds: [String]?
        var sortBy: WsListPicks.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/pick/listpicks"
        }
        
        class func isQueueable() -> Bool {
            return false
        }
        
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
            
            if let opsOrgUnitIdsArrayValue = json["opsOrgUnitIds"].array {
                self.opsOrgUnitIds = []
                for item in opsOrgUnitIdsArrayValue {
                    if var opsOrgUnitIds = opsOrgUnitIds, let itemValue = item.string {
                        opsOrgUnitIds.append(itemValue)
                    }
                }
            }
            
            if let salesOrgUnitIdsArrayValue = json["salesOrgUnitIds"].array {
                self.salesOrgUnitIds = []
                for item in salesOrgUnitIdsArrayValue {
                    if var salesOrgUnitIds = salesOrgUnitIds, let itemValue = item.string {
                        salesOrgUnitIds.append(itemValue)
                    }
                }
            }
            
            if let anyOrgUnitIdsArrayValue = json["anyOrgUnitIds"].array {
                self.anyOrgUnitIds = []
                for item in anyOrgUnitIdsArrayValue {
                    if var anyOrgUnitIds = anyOrgUnitIds, let itemValue = item.string {
                        anyOrgUnitIds.append(itemValue)
                    }
                }
            }
            
            if let orderIdsArrayValue = json["orderIds"].array {
                self.orderIds = []
                for item in orderIdsArrayValue {
                    if var orderIds = orderIds, let itemValue = item.string {
                        orderIds.append(itemValue)
                    }
                }
            }
            
            if let orderLineIdsArrayValue = json["orderLineIds"].array {
                self.orderLineIds = []
                for item in orderLineIdsArrayValue {
                    if var orderLineIds = orderLineIds, let itemValue = item.string {
                        orderLineIds.append(itemValue)
                    }
                }
            }
            
            if let shipmentIdsArrayValue = json["shipmentIds"].array {
                self.shipmentIds = []
                for item in shipmentIdsArrayValue {
                    if var shipmentIds = shipmentIds, let itemValue = item.string {
                        shipmentIds.append(itemValue)
                    }
                }
            }
            
            if let fromLocationTypesArrayValue = json["fromLocationTypes"].array {
                self.fromLocationTypes = []
                for item in fromLocationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var fromLocationTypes = fromLocationTypes {
                        fromLocationTypes.append(value)
                    }
                }
            }
            
            if let fromLocationIdsArrayValue = json["fromLocationIds"].array {
                self.fromLocationIds = []
                for item in fromLocationIdsArrayValue {
                    if var fromLocationIds = fromLocationIds, let itemValue = item.string {
                        fromLocationIds.append(itemValue)
                    }
                }
            }
            
            if let toLocationTypesArrayValue = json["toLocationTypes"].array {
                self.toLocationTypes = []
                for item in toLocationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var toLocationTypes = toLocationTypes {
                        toLocationTypes.append(value)
                    }
                }
            }
            
            if let toLocationIdsArrayValue = json["toLocationIds"].array {
                self.toLocationIds = []
                for item in toLocationIdsArrayValue {
                    if var toLocationIds = toLocationIds, let itemValue = item.string {
                        toLocationIds.append(itemValue)
                    }
                }
            }
            
            if let anyLocationTypesArrayValue = json["anyLocationTypes"].array {
                self.anyLocationTypes = []
                for item in anyLocationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var anyLocationTypes = anyLocationTypes {
                        anyLocationTypes.append(value)
                    }
                }
            }
            
            if let anyLocationIdsArrayValue = json["anyLocationIds"].array {
                self.anyLocationIds = []
                for item in anyLocationIdsArrayValue {
                    if var anyLocationIds = anyLocationIds, let itemValue = item.string {
                        anyLocationIds.append(itemValue)
                    }
                }
            }
            
            if let fromContainerTypesArrayValue = json["fromContainerTypes"].array {
                self.fromContainerTypes = []
                for item in fromContainerTypesArrayValue {
                    if let value = StockContainerType(rawValue: item.stringValue), var fromContainerTypes = fromContainerTypes {
                        fromContainerTypes.append(value)
                    }
                }
            }
            
            if let fromContainerIdsArrayValue = json["fromContainerIds"].array {
                self.fromContainerIds = []
                for item in fromContainerIdsArrayValue {
                    if var fromContainerIds = fromContainerIds, let itemValue = item.string {
                        fromContainerIds.append(itemValue)
                    }
                }
            }
            
            if let toContainerTypesArrayValue = json["toContainerTypes"].array {
                self.toContainerTypes = []
                for item in toContainerTypesArrayValue {
                    if let value = StockContainerType(rawValue: item.stringValue), var toContainerTypes = toContainerTypes {
                        toContainerTypes.append(value)
                    }
                }
            }
            
            if let toContainerIdsArrayValue = json["toContainerIds"].array {
                self.toContainerIds = []
                for item in toContainerIdsArrayValue {
                    if var toContainerIds = toContainerIds, let itemValue = item.string {
                        toContainerIds.append(itemValue)
                    }
                }
            }
            
            if let anyContainerTypesArrayValue = json["anyContainerTypes"].array {
                self.anyContainerTypes = []
                for item in anyContainerTypesArrayValue {
                    if let value = StockContainerType(rawValue: item.stringValue), var anyContainerTypes = anyContainerTypes {
                        anyContainerTypes.append(value)
                    }
                }
            }
            
            if let anyContainerIdsArrayValue = json["anyContainerIds"].array {
                self.anyContainerIds = []
                for item in anyContainerIdsArrayValue {
                    if var anyContainerIds = anyContainerIds, let itemValue = item.string {
                        anyContainerIds.append(itemValue)
                    }
                }
            }
            
            if let itemTypesArrayValue = json["itemTypes"].array {
                self.itemTypes = []
                for item in itemTypesArrayValue {
                    if let value = ItemType(rawValue: item.stringValue), var itemTypes = itemTypes {
                        itemTypes.append(value)
                    }
                }
            }
            
            if let itemClassesArrayValue = json["itemClasses"].array {
                self.itemClasses = []
                for item in itemClassesArrayValue {
                    if let value = ItemClass(rawValue: item.stringValue), var itemClasses = itemClasses {
                        itemClasses.append(value)
                    }
                }
            }
            
            if let itemIdsArrayValue = json["itemIds"].array {
                self.itemIds = []
                for item in itemIdsArrayValue {
                    if var itemIds = itemIds, let itemValue = item.string {
                        itemIds.append(itemValue)
                    }
                }
            }
            
            if let assignedToUserIdsArrayValue = json["assignedToUserIds"].array {
                self.assignedToUserIds = []
                for item in assignedToUserIdsArrayValue {
                    if var assignedToUserIds = assignedToUserIds, let itemValue = item.string {
                        assignedToUserIds.append(itemValue)
                    }
                }
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListPicks.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

enum SortBy: String {
    case PICK_NUMBER
    case ITEM_NUMBER
    case FROM_LOCATION
    case TO_LOCATION
    case FROM_CONTAINER
    case TO_CONTAINER
    case RELEASE_DATE
    case RELEASED_DATE
    case CREATED_DATE
    case ASSIGNED_DATE
    case ASSIGNED_NAME
    case IN_PROGRESS_DATE
    case PICKED_DATE
    case COMPLETED_DATE
}

class Response: JSONSerializable {
    var code: WsListPicks.Code?
    var picks: [Pick]?

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
    
    if let codeStringValue = json["code"].string {
        if let code = WsListPicks.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let picksArrayValue = json["picks"].array {
        self.picks = []
        for item in picksArrayValue {
            if let value = Pick(json: item), var picks = picks {
                picks.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    return dictionary
}
}

}
