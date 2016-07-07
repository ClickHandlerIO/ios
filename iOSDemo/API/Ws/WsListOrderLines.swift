import Foundation
import SwiftyJSON

struct WsListOrderLines {

    class Request: WsRequest {
        typealias Response = WsListOrderLines.Response
        
        var orderId: String?
        var sortBy: WsListOrderLines.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/inventory/order/line/listorderlines"
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
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListOrderLines.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let orderId = self.orderId {
                dictionary["orderId"] = orderId
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

class Response: JSONSerializable {
    var code: WsListOrderLines.Code?
    var orderLines: [WsListOrderLines.OrderLine]?

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
        if let code = WsListOrderLines.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let orderLinesArrayValue = json["orderLines"].array {
        self.orderLines = []
        for item in orderLinesArrayValue {
            if let value = WsListOrderLines.OrderLine(json: item), var orderLines = orderLines {
                orderLines.append(value)
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

enum SortBy: String {
    case QUANTITY_REQUESTED
    case QUANTITY_RESERVED
    case QUANTITY_OPEN
    case QUANTITY_ALLOC
    case QUANTITY_PICKED
    case QUANTITY_SHIPPED
    case QUANTITY_DELIVERED
    case QUANTITY_VERIFIED
    case QUANTITY_MISSING
    case QUANTITY_UNEXPECTED
    case ITEM_SET_NUMBER
    case ITEM_SET_LONG_DESC
    case ITEM_SET_SHORT_DESC
    case ITEM_SET_VERSION
    case ITEM_NUMBER
    case ITEM_LONG_DESC
    case ITEM_SHORT_DESC
    case ITEM_CLASS
    case ITEM_TYPE
    case ITEM_VERSION
    case LOT_NUMBER
    case SERIAL_NUMBER
}

class OrderLine: JSONSerializable {
    var id: String?
    var quantityRequested: Int?
    var quantityOpen: Int?
    var quantityReserved: Int?
    var quantityAllocated: Int?
    var quantityPicked: Int?
    var quantityShipped: Int?
    var quantityDelivered: Int?
    var quantityVerified: Int?
    var quantityMissing: Int?
    var quantityUnexpected: Int?
    var listPrice: Double?
    var contractPrice: Double?
    var overridePrice: Double?
    var extendedPrice: Double?
    var hasDispute: Bool?
    var closed: Bool?
    var bizUnitId: String?
    var bizUnitName: String?
    var itemSetId: String?
    var itemSetNumber: String?
    var itemSetLongDesc: String?
    var itemSetShortDesc: String?
    var itemSetClass: ItemClass?
    var itemSetType: ItemType?
    var itemSetVersionId: String?
    var itemSetVersion: String?
    var itemSetVersionStartManuDate: Int?
    var itemSetVersionEndManuDate: Int?
    var itemId: String?
    var itemNumber: String?
    var itemLongDesc: String?
    var itemShortDesc: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var itemVersionId: String?
    var version: String?
    var versionStartManuDate: Int?
    var versionEndManuDate: Int?
    var lotId: String?
    var lotNumber: String?
    var lotExpirationDate: Int?
    var lotManuDate: Int?
    var serialId: String?
    var serialNumber: Int?
    var stockId: String?
    var serialExpirationDate: Int?
    var serialManuDate: Int?

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
    
    if let quantityRequested = json["quantityRequested"].int {
        self.quantityRequested = quantityRequested
    }
    
    if let quantityOpen = json["quantityOpen"].int {
        self.quantityOpen = quantityOpen
    }
    
    if let quantityReserved = json["quantityReserved"].int {
        self.quantityReserved = quantityReserved
    }
    
    if let quantityAllocated = json["quantityAllocated"].int {
        self.quantityAllocated = quantityAllocated
    }
    
    if let quantityPicked = json["quantityPicked"].int {
        self.quantityPicked = quantityPicked
    }
    
    if let quantityShipped = json["quantityShipped"].int {
        self.quantityShipped = quantityShipped
    }
    
    if let quantityDelivered = json["quantityDelivered"].int {
        self.quantityDelivered = quantityDelivered
    }
    
    if let quantityVerified = json["quantityVerified"].int {
        self.quantityVerified = quantityVerified
    }
    
    if let quantityMissing = json["quantityMissing"].int {
        self.quantityMissing = quantityMissing
    }
    
    if let quantityUnexpected = json["quantityUnexpected"].int {
        self.quantityUnexpected = quantityUnexpected
    }
    
    if let listPrice = json["listPrice"].double {
        self.listPrice = listPrice
    }
    
    if let contractPrice = json["contractPrice"].double {
        self.contractPrice = contractPrice
    }
    
    if let overridePrice = json["overridePrice"].double {
        self.overridePrice = overridePrice
    }
    
    if let extendedPrice = json["extendedPrice"].double {
        self.extendedPrice = extendedPrice
    }
    
    if let hasDispute = json["hasDispute"].bool {
        self.hasDispute = hasDispute
    }
    
    if let closed = json["closed"].bool {
        self.closed = closed
    }
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let bizUnitName = json["bizUnitName"].string {
        self.bizUnitName = bizUnitName
    }
    
    if let itemSetId = json["itemSetId"].string {
        self.itemSetId = itemSetId
    }
    
    if let itemSetNumber = json["itemSetNumber"].string {
        self.itemSetNumber = itemSetNumber
    }
    
    if let itemSetLongDesc = json["itemSetLongDesc"].string {
        self.itemSetLongDesc = itemSetLongDesc
    }
    
    if let itemSetShortDesc = json["itemSetShortDesc"].string {
        self.itemSetShortDesc = itemSetShortDesc
    }
    
    if let itemSetClassStringValue = json["itemSetClass"].string {
        if let itemSetClass = ItemClass(rawValue: itemSetClassStringValue) {
            self.itemSetClass = itemSetClass
        }
    }
    
    if let itemSetTypeStringValue = json["itemSetType"].string {
        if let itemSetType = ItemType(rawValue: itemSetTypeStringValue) {
            self.itemSetType = itemSetType
        }
    }
    
    if let itemSetVersionId = json["itemSetVersionId"].string {
        self.itemSetVersionId = itemSetVersionId
    }
    
    if let itemSetVersion = json["itemSetVersion"].string {
        self.itemSetVersion = itemSetVersion
    }
    
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
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let version = json["version"].string {
        self.version = version
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let serialNumber = json["serialNumber"].int {
        self.serialNumber = serialNumber
    }
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let quantityRequested = self.quantityRequested {
        dictionary["quantityRequested"] = quantityRequested
    }
    
    if let quantityOpen = self.quantityOpen {
        dictionary["quantityOpen"] = quantityOpen
    }
    
    if let quantityReserved = self.quantityReserved {
        dictionary["quantityReserved"] = quantityReserved
    }
    
    if let quantityAllocated = self.quantityAllocated {
        dictionary["quantityAllocated"] = quantityAllocated
    }
    
    if let quantityPicked = self.quantityPicked {
        dictionary["quantityPicked"] = quantityPicked
    }
    
    if let quantityShipped = self.quantityShipped {
        dictionary["quantityShipped"] = quantityShipped
    }
    
    if let quantityDelivered = self.quantityDelivered {
        dictionary["quantityDelivered"] = quantityDelivered
    }
    
    if let quantityVerified = self.quantityVerified {
        dictionary["quantityVerified"] = quantityVerified
    }
    
    if let quantityMissing = self.quantityMissing {
        dictionary["quantityMissing"] = quantityMissing
    }
    
    if let quantityUnexpected = self.quantityUnexpected {
        dictionary["quantityUnexpected"] = quantityUnexpected
    }
    
    if let listPrice = self.listPrice {
        dictionary["listPrice"] = listPrice
    }
    
    if let contractPrice = self.contractPrice {
        dictionary["contractPrice"] = contractPrice
    }
    
    if let overridePrice = self.overridePrice {
        dictionary["overridePrice"] = overridePrice
    }
    
    if let extendedPrice = self.extendedPrice {
        dictionary["extendedPrice"] = extendedPrice
    }
    
    if let hasDispute = self.hasDispute {
        dictionary["hasDispute"] = hasDispute
    }
    
    if let closed = self.closed {
        dictionary["closed"] = closed
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let bizUnitName = self.bizUnitName {
        dictionary["bizUnitName"] = bizUnitName
    }
    
    if let itemSetId = self.itemSetId {
        dictionary["itemSetId"] = itemSetId
    }
    
    if let itemSetNumber = self.itemSetNumber {
        dictionary["itemSetNumber"] = itemSetNumber
    }
    
    if let itemSetLongDesc = self.itemSetLongDesc {
        dictionary["itemSetLongDesc"] = itemSetLongDesc
    }
    
    if let itemSetShortDesc = self.itemSetShortDesc {
        dictionary["itemSetShortDesc"] = itemSetShortDesc
    }
    
    if let itemSetClass = self.itemSetClass {
        dictionary["itemSetClass"] = itemSetClass.rawValue
    }
    
    if let itemSetType = self.itemSetType {
        dictionary["itemSetType"] = itemSetType.rawValue
    }
    
    if let itemSetVersionId = self.itemSetVersionId {
        dictionary["itemSetVersionId"] = itemSetVersionId
    }
    
    if let itemSetVersion = self.itemSetVersion {
        dictionary["itemSetVersion"] = itemSetVersion
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
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let version = self.version {
        dictionary["version"] = version
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ORDER_ID_REQUIRED
    case FAILED
}

}
