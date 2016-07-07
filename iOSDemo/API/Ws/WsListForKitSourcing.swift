import Foundation
import SwiftyJSON

struct WsListForKitSourcing {

    class Request: WsRequest {
        typealias Response = WsListForKitSourcing.Response
        
        var kitStockId: String?
        var minimumPercentageMatch: Double?
        var locationTypes: [LocationType]?
        var locationIds: [String]?
        
        class func getPath() -> String {
            return "/inventory/sourcing/listforkitsource"
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
            
            if let kitStockId = json["kitStockId"].string {
                self.kitStockId = kitStockId
            }
            
            if let minimumPercentageMatch = json["minimumPercentageMatch"].double {
                self.minimumPercentageMatch = minimumPercentageMatch
            }
            
            if let locationTypesArrayValue = json["locationTypes"].array {
                self.locationTypes = []
                for item in locationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var locationTypes = locationTypes {
                        locationTypes.append(value)
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let kitStockId = self.kitStockId {
                dictionary["kitStockId"] = kitStockId
            }
            
            if let minimumPercentageMatch = self.minimumPercentageMatch {
                dictionary["minimumPercentageMatch"] = minimumPercentageMatch
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListForKitSourcing.Code?
    var locations: [WsListForKitSourcing.KitSourcingLocation]?
    var items: [WsListForKitSourcing.SourcingLine]?

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
        if let code = WsListForKitSourcing.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let locationsArrayValue = json["locations"].array {
        self.locations = []
        for item in locationsArrayValue {
            if let value = WsListForKitSourcing.KitSourcingLocation(json: item), var locations = locations {
                locations.append(value)
            }
        }
    }
    
    if let itemsArrayValue = json["items"].array {
        self.items = []
        for item in itemsArrayValue {
            if let value = WsListForKitSourcing.SourcingLine(json: item), var items = items {
                items.append(value)
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

class KitSourcingLocation: JSONSerializable {
    var locationKey: String?
    var location: InventoryLocation?
    var percentageMatch: Double?
    var distance: Double?
    var inTransit: Bool?

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
    
    if let locationKey = json["locationKey"].string {
        self.locationKey = locationKey
    }
    
    self.location = InventoryLocation(json: json["location"])
    
    if let percentageMatch = json["percentageMatch"].double {
        self.percentageMatch = percentageMatch
    }
    
    if let distance = json["distance"].double {
        self.distance = distance
    }
    
    if let inTransit = json["inTransit"].bool {
        self.inTransit = inTransit
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let locationKey = self.locationKey {
        dictionary["locationKey"] = locationKey
    }
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    if let percentageMatch = self.percentageMatch {
        dictionary["percentageMatch"] = percentageMatch
    }
    
    if let distance = self.distance {
        dictionary["distance"] = distance
    }
    
    if let inTransit = self.inTransit {
        dictionary["inTransit"] = inTransit
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case KIT_STOCK_ID_REQUIRED
    case KIT_NOT_FOUND
    case FAILED
}

class SourcingLine: JSONSerializable {
    var componentId: String?
    var itemId: String?
    var itemVersionId: String?
    var itemNumber: String?
    var itemDesc: String?
    var itemType: ItemType?
    var itemClass: ItemClass?
    var qtyOpen: Int?
    var locationItems: [WsListForKitSourcing.LineAvailability]?
    var childItems: [WsListForKitSourcing.SourcingLine]?

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
    
    if let componentId = json["componentId"].string {
        self.componentId = componentId
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemDesc = json["itemDesc"].string {
        self.itemDesc = itemDesc
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let qtyOpen = json["qtyOpen"].int {
        self.qtyOpen = qtyOpen
    }
    
    if let locationItemsArrayValue = json["locationItems"].array {
        self.locationItems = []
        for item in locationItemsArrayValue {
            if let value = WsListForKitSourcing.LineAvailability(json: item), var locationItems = locationItems {
                locationItems.append(value)
            }
        }
    }
    
    if let childItemsArrayValue = json["childItems"].array {
        self.childItems = []
        for item in childItemsArrayValue {
            if let value = WsListForKitSourcing.SourcingLine(json: item), var childItems = childItems {
                childItems.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let componentId = self.componentId {
        dictionary["componentId"] = componentId
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemDesc = self.itemDesc {
        dictionary["itemDesc"] = itemDesc
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let qtyOpen = self.qtyOpen {
        dictionary["qtyOpen"] = qtyOpen
    }
    
    return dictionary
}
}

class LineAvailability: JSONSerializable {
    var locationKey: String?
    var qtyAvailable: Int?
    var qtyAvailableInvalid: Int?
    var qtySourced: Int?
    var availableStockIds: [String]?

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
    
    if let locationKey = json["locationKey"].string {
        self.locationKey = locationKey
    }
    
    if let qtyAvailable = json["qtyAvailable"].int {
        self.qtyAvailable = qtyAvailable
    }
    
    if let qtyAvailableInvalid = json["qtyAvailableInvalid"].int {
        self.qtyAvailableInvalid = qtyAvailableInvalid
    }
    
    if let qtySourced = json["qtySourced"].int {
        self.qtySourced = qtySourced
    }
    
    if let availableStockIdsArrayValue = json["availableStockIds"].array {
        self.availableStockIds = []
        for item in availableStockIdsArrayValue {
            if var availableStockIds = availableStockIds, let itemValue = item.string {
                availableStockIds.append(itemValue)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let locationKey = self.locationKey {
        dictionary["locationKey"] = locationKey
    }
    
    if let qtyAvailable = self.qtyAvailable {
        dictionary["qtyAvailable"] = qtyAvailable
    }
    
    if let qtyAvailableInvalid = self.qtyAvailableInvalid {
        dictionary["qtyAvailableInvalid"] = qtyAvailableInvalid
    }
    
    if let qtySourced = self.qtySourced {
        dictionary["qtySourced"] = qtySourced
    }
    
    return dictionary
}
}

}
