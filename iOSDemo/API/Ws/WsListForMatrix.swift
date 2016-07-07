import Foundation
import SwiftyJSON

struct WsListForMatrix {

    class Request: WsRequest {
        typealias Response = WsListForMatrix.Response
        
        var orderId: String?
        var minimumPercentageMatch: Double?
        var locationTypes: [LocationType]?
        var locationIds: [String]?
        var itemClass: [ItemClass]?
        
        class func getPath() -> String {
            return "/inventory/sourcing/listformatrix"
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
            
            if let orderId = json["orderId"].string {
                self.orderId = orderId
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
            
            if let itemClassArrayValue = json["itemClass"].array {
                self.itemClass = []
                for item in itemClassArrayValue {
                    if let value = ItemClass(rawValue: item.stringValue), var itemClass = itemClass {
                        itemClass.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let orderId = self.orderId {
                dictionary["orderId"] = orderId
            }
            
            if let minimumPercentageMatch = self.minimumPercentageMatch {
                dictionary["minimumPercentageMatch"] = minimumPercentageMatch
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

enum Code: String {
    case SUCCESS
    case NOT_IMPLEMENTED
    case ORDER_ID_REQUIRED
    case NO_OPEN_ORDER_LINES
    case ORDER_NOT_FOUND
    case FAILED
}

class SourcingLine: JSONSerializable {
    var orderLineId: String?
    var itemId: String?
    var itemVersionId: String?
    var lotId: String?
    var serialId: String?
    var itemNumber: String?
    var itemDesc: String?
    var itemType: ItemType?
    var itemClass: ItemClass?
    var qtyOpen: Int?
    var locationItems: [WsListForMatrix.LineAvailability]?
    var childItems: [WsListForMatrix.SourcingLine]?

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
    
    if let orderLineId = json["orderLineId"].string {
        self.orderLineId = orderLineId
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
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
            if let value = WsListForMatrix.LineAvailability(json: item), var locationItems = locationItems {
                locationItems.append(value)
            }
        }
    }
    
    if let childItemsArrayValue = json["childItems"].array {
        self.childItems = []
        for item in childItemsArrayValue {
            if let value = WsListForMatrix.SourcingLine(json: item), var childItems = childItems {
                childItems.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orderLineId = self.orderLineId {
        dictionary["orderLineId"] = orderLineId
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
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

class CaseEvent: JSONSerializable {
    var caseEventId: String?
    var caseNumber: Int?
    var eventDate: Int?
    var status: CaseEventStatus?
    var patientName: String?
    var patientMrn: String?
    var facilityName: String?
    var surgeonName: String?

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
    
    if let caseEventId = json["caseEventId"].string {
        self.caseEventId = caseEventId
    }
    
    if let caseNumber = json["caseNumber"].int {
        self.caseNumber = caseNumber
    }
    
    if let statusStringValue = json["status"].string {
        if let status = CaseEventStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
    
    if let patientName = json["patientName"].string {
        self.patientName = patientName
    }
    
    if let patientMrn = json["patientMrn"].string {
        self.patientMrn = patientMrn
    }
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let surgeonName = json["surgeonName"].string {
        self.surgeonName = surgeonName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let caseEventId = self.caseEventId {
        dictionary["caseEventId"] = caseEventId
    }
    
    if let caseNumber = self.caseNumber {
        dictionary["caseNumber"] = caseNumber
    }
    
    if let status = self.status {
        dictionary["status"] = status.rawValue
    }
    
    if let patientName = self.patientName {
        dictionary["patientName"] = patientName
    }
    
    if let patientMrn = self.patientMrn {
        dictionary["patientMrn"] = patientMrn
    }
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let surgeonName = self.surgeonName {
        dictionary["surgeonName"] = surgeonName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListForMatrix.Code?
    var caseEvent: WsListForMatrix.CaseEvent?
    var locations: [WsListForMatrix.SourcingLocation]?
    var items: [WsListForMatrix.SourcingLine]?

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
        if let code = WsListForMatrix.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.caseEvent = WsListForMatrix.CaseEvent(json: json["caseEvent"])
    
    if let locationsArrayValue = json["locations"].array {
        self.locations = []
        for item in locationsArrayValue {
            if let value = WsListForMatrix.SourcingLocation(json: item), var locations = locations {
                locations.append(value)
            }
        }
    }
    
    if let itemsArrayValue = json["items"].array {
        self.items = []
        for item in itemsArrayValue {
            if let value = WsListForMatrix.SourcingLine(json: item), var items = items {
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
    
    if let caseEvent = self.caseEvent {
        dictionary["caseEvent"] = caseEvent.asDictionary()
    }
    
    return dictionary
}
}

class SourcingLocation: JSONSerializable {
    var locationKey: String?
    var location: InventoryLocation?
    var loanEntity: LoanEntity?
    var percentageMatch: Double?
    var distance: Double?
    var inTransit: Bool?
    var shipDestination: WsListForMatrix.ShipDestination?

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
    
    self.loanEntity = LoanEntity(json: json["loanEntity"])
    
    if let percentageMatch = json["percentageMatch"].double {
        self.percentageMatch = percentageMatch
    }
    
    if let distance = json["distance"].double {
        self.distance = distance
    }
    
    if let inTransit = json["inTransit"].bool {
        self.inTransit = inTransit
    }
    
    if let shipDestinationStringValue = json["shipDestination"].string {
        if let shipDestination = WsListForMatrix.ShipDestination(rawValue: shipDestinationStringValue) {
            self.shipDestination = shipDestination
        }
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
    
    if let loanEntity = self.loanEntity {
        dictionary["loanEntity"] = loanEntity.asDictionary()
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
    
    if let shipDestination = self.shipDestination {
        dictionary["shipDestination"] = shipDestination.rawValue
    }
    
    return dictionary
}
}

enum ShipDestination: String {
    case DIRECT
    case CONSOLIDATE
    case BACK_TO_BACK
}

}
