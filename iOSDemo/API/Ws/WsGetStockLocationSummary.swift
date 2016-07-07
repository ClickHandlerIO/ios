import Foundation
import SwiftyJSON

struct WsGetStockLocationSummary {

    class Request: WsRequest {
        typealias Response = WsGetStockLocationSummary.Response
        
        var bizUnitIds: [String]?
        var inventoryTypeIds: [String]?
        var itemIds: [String]?
        var itemClasses: [ItemClass]?
        var itemTypes: [ItemType]?
        var itemVersionIds: [String]?
        var serialIds: [String]?
        var lotIds: [String]?
        var homeLocationIds: [String]?
        var locationIds: [String]?
        var fromLocationIds: [String]?
        var toLocationIds: [String]?
        var dueBackLocationIds: [String]?
        var containerTypes: [StockContainerType]?
        var containerIds: [String]?
        var rootContainerTypes: [StockContainerType]?
        var rootContainerIds: [String]?
        var stockStatuses: [StockStatus]?
        var search: String?
        var sortBy: WsGetStockLocationSummary.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/inventory/stock/getstocklocationsumm"
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
            
            if let bizUnitIdsArrayValue = json["bizUnitIds"].array {
                self.bizUnitIds = []
                for item in bizUnitIdsArrayValue {
                    if var bizUnitIds = bizUnitIds, let itemValue = item.string {
                        bizUnitIds.append(itemValue)
                    }
                }
            }
            
            if let inventoryTypeIdsArrayValue = json["inventoryTypeIds"].array {
                self.inventoryTypeIds = []
                for item in inventoryTypeIdsArrayValue {
                    if var inventoryTypeIds = inventoryTypeIds, let itemValue = item.string {
                        inventoryTypeIds.append(itemValue)
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
            
            if let itemClassesArrayValue = json["itemClasses"].array {
                self.itemClasses = []
                for item in itemClassesArrayValue {
                    if let value = ItemClass(rawValue: item.stringValue), var itemClasses = itemClasses {
                        itemClasses.append(value)
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
            
            if let itemVersionIdsArrayValue = json["itemVersionIds"].array {
                self.itemVersionIds = []
                for item in itemVersionIdsArrayValue {
                    if var itemVersionIds = itemVersionIds, let itemValue = item.string {
                        itemVersionIds.append(itemValue)
                    }
                }
            }
            
            if let serialIdsArrayValue = json["serialIds"].array {
                self.serialIds = []
                for item in serialIdsArrayValue {
                    if var serialIds = serialIds, let itemValue = item.string {
                        serialIds.append(itemValue)
                    }
                }
            }
            
            if let lotIdsArrayValue = json["lotIds"].array {
                self.lotIds = []
                for item in lotIdsArrayValue {
                    if var lotIds = lotIds, let itemValue = item.string {
                        lotIds.append(itemValue)
                    }
                }
            }
            
            if let homeLocationIdsArrayValue = json["homeLocationIds"].array {
                self.homeLocationIds = []
                for item in homeLocationIdsArrayValue {
                    if var homeLocationIds = homeLocationIds, let itemValue = item.string {
                        homeLocationIds.append(itemValue)
                    }
                }
            }
            
            if let locationIdsArrayValue = json["locationIds"].array {
                self.locationIds = []
                for item in locationIdsArrayValue {
                    if var locationIds = locationIds, let itemValue = item.string {
                        locationIds.append(itemValue)
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
            
            if let toLocationIdsArrayValue = json["toLocationIds"].array {
                self.toLocationIds = []
                for item in toLocationIdsArrayValue {
                    if var toLocationIds = toLocationIds, let itemValue = item.string {
                        toLocationIds.append(itemValue)
                    }
                }
            }
            
            if let dueBackLocationIdsArrayValue = json["dueBackLocationIds"].array {
                self.dueBackLocationIds = []
                for item in dueBackLocationIdsArrayValue {
                    if var dueBackLocationIds = dueBackLocationIds, let itemValue = item.string {
                        dueBackLocationIds.append(itemValue)
                    }
                }
            }
            
            if let containerTypesArrayValue = json["containerTypes"].array {
                self.containerTypes = []
                for item in containerTypesArrayValue {
                    if let value = StockContainerType(rawValue: item.stringValue), var containerTypes = containerTypes {
                        containerTypes.append(value)
                    }
                }
            }
            
            if let containerIdsArrayValue = json["containerIds"].array {
                self.containerIds = []
                for item in containerIdsArrayValue {
                    if var containerIds = containerIds, let itemValue = item.string {
                        containerIds.append(itemValue)
                    }
                }
            }
            
            if let rootContainerTypesArrayValue = json["rootContainerTypes"].array {
                self.rootContainerTypes = []
                for item in rootContainerTypesArrayValue {
                    if let value = StockContainerType(rawValue: item.stringValue), var rootContainerTypes = rootContainerTypes {
                        rootContainerTypes.append(value)
                    }
                }
            }
            
            if let rootContainerIdsArrayValue = json["rootContainerIds"].array {
                self.rootContainerIds = []
                for item in rootContainerIdsArrayValue {
                    if var rootContainerIds = rootContainerIds, let itemValue = item.string {
                        rootContainerIds.append(itemValue)
                    }
                }
            }
            
            if let stockStatusesArrayValue = json["stockStatuses"].array {
                self.stockStatuses = []
                for item in stockStatusesArrayValue {
                    if let value = StockStatus(rawValue: item.stringValue), var stockStatuses = stockStatuses {
                        stockStatuses.append(value)
                    }
                }
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsGetStockLocationSummary.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

enum SortBy: String {
    case ITEM_NUMBER
    case QTY_ON_HAND
    case QTY_AVAIL
    case QTY_UNAVAIL
    case QTY_HOLD
    case QTY_ALLOC
    case QTY_LOST
    case QTY_FOUND
}

class Response: JSONSerializable {
    var code: WsGetStockLocationSummary.Code?
    var locationSummaries: [WsGetStockLocationSummary.StockLocationSummary]?

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
        if let code = WsGetStockLocationSummary.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let locationSummariesArrayValue = json["locationSummaries"].array {
        self.locationSummaries = []
        for item in locationSummariesArrayValue {
            if let value = WsGetStockLocationSummary.StockLocationSummary(json: item), var locationSummaries = locationSummaries {
                locationSummaries.append(value)
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

class StockLocationSummary: JSONSerializable {
    var fromLocation: Location?
    var location: Location?
    var toLocation: Location?
    var itemId: String?
    var itemNumber: String?
    var itemLongDesc: String?
    var itemShortDesc: String?
    var qtyOnHand: Int?
    var qtyAvailable: Int?
    var qtyUnAvailable: Int?
    var qtyOnHold: Int?
    var qtyAllocated: Int?
    var qtyLost: Int?
    var qtyFound: Int?

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
    
    self.fromLocation = Location(json: json["fromLocation"])
    
    self.location = Location(json: json["location"])
    
    self.toLocation = Location(json: json["toLocation"])
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemLongDesc = json["itemLongDesc"].string {
        self.itemLongDesc = itemLongDesc
    }
    
    if let itemShortDesc = json["itemShortDesc"].string {
        self.itemShortDesc = itemShortDesc
    }
    
    if let qtyOnHand = json["qtyOnHand"].int {
        self.qtyOnHand = qtyOnHand
    }
    
    if let qtyAvailable = json["qtyAvailable"].int {
        self.qtyAvailable = qtyAvailable
    }
    
    if let qtyUnAvailable = json["qtyUnAvailable"].int {
        self.qtyUnAvailable = qtyUnAvailable
    }
    
    if let qtyOnHold = json["qtyOnHold"].int {
        self.qtyOnHold = qtyOnHold
    }
    
    if let qtyAllocated = json["qtyAllocated"].int {
        self.qtyAllocated = qtyAllocated
    }
    
    if let qtyLost = json["qtyLost"].int {
        self.qtyLost = qtyLost
    }
    
    if let qtyFound = json["qtyFound"].int {
        self.qtyFound = qtyFound
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let fromLocation = self.fromLocation {
        dictionary["fromLocation"] = fromLocation.asDictionary()
    }
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    if let toLocation = self.toLocation {
        dictionary["toLocation"] = toLocation.asDictionary()
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemLongDesc = self.itemLongDesc {
        dictionary["itemLongDesc"] = itemLongDesc
    }
    
    if let itemShortDesc = self.itemShortDesc {
        dictionary["itemShortDesc"] = itemShortDesc
    }
    
    if let qtyOnHand = self.qtyOnHand {
        dictionary["qtyOnHand"] = qtyOnHand
    }
    
    if let qtyAvailable = self.qtyAvailable {
        dictionary["qtyAvailable"] = qtyAvailable
    }
    
    if let qtyUnAvailable = self.qtyUnAvailable {
        dictionary["qtyUnAvailable"] = qtyUnAvailable
    }
    
    if let qtyOnHold = self.qtyOnHold {
        dictionary["qtyOnHold"] = qtyOnHold
    }
    
    if let qtyAllocated = self.qtyAllocated {
        dictionary["qtyAllocated"] = qtyAllocated
    }
    
    if let qtyLost = self.qtyLost {
        dictionary["qtyLost"] = qtyLost
    }
    
    if let qtyFound = self.qtyFound {
        dictionary["qtyFound"] = qtyFound
    }
    
    return dictionary
}
}

}
