import Foundation
import SwiftyJSON

struct WsListLoanLines {

    class Request: WsRequest {
        typealias Response = WsListLoanLines.Response
        
        var loanId: String?
        var sortBy: WsListLoanLines.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/loan/line/listloanlines"
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
            
            if let loanId = json["loanId"].string {
                self.loanId = loanId
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListLoanLines.SortBy(rawValue: sortByStringValue) {
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
            
            if let loanId = self.loanId {
                dictionary["loanId"] = loanId
            }
            
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

class Response: JSONSerializable {
    var code: WsListLoanLines.Code?
    var loanLines: [WsListLoanLines.LoanLine]?

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
        if let code = WsListLoanLines.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let loanLinesArrayValue = json["loanLines"].array {
        self.loanLines = []
        for item in loanLinesArrayValue {
            if let value = WsListLoanLines.LoanLine(json: item), var loanLines = loanLines {
                loanLines.append(value)
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

class LoanLine: JSONSerializable {
    var id: String?
    var quantityRequested: Int?
    var quantityCommitted: Int?
    var quantityOnOrder: Int?
    var quantityOnHand: Int?
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
    
    if let quantityCommitted = json["quantityCommitted"].int {
        self.quantityCommitted = quantityCommitted
    }
    
    if let quantityOnOrder = json["quantityOnOrder"].int {
        self.quantityOnOrder = quantityOnOrder
    }
    
    if let quantityOnHand = json["quantityOnHand"].int {
        self.quantityOnHand = quantityOnHand
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
    
    if let quantityCommitted = self.quantityCommitted {
        dictionary["quantityCommitted"] = quantityCommitted
    }
    
    if let quantityOnOrder = self.quantityOnOrder {
        dictionary["quantityOnOrder"] = quantityOnOrder
    }
    
    if let quantityOnHand = self.quantityOnHand {
        dictionary["quantityOnHand"] = quantityOnHand
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

enum SortBy: String {
    case QUANTITY_REQUESTED
    case QUANTITY_COMMITTED
    case QUANTITY_ON_ORDER
    case QUANTITY_ON_HAND
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

enum Code: String {
    case SUCCESS
    case LOAN_ID_REQUIRED
    case FAILED
}

}
