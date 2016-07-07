import Foundation
import SwiftyJSON

struct WsListItems {

    class Request: WsRequest {
        typealias Response = WsListItems.Response
        
        var bizUnitIds: [String]?
        var orgUnitIds: [String]?
        var categoryIds: [String]?
        var itemTypes: [ItemType]?
        var itemClasses: [ItemClass]?
        var search: String?
        var barcode: String?
        var sortBy: WsListItems.SortBy?
        var sortDescending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/item/listitems"
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
            
            if let orgUnitIdsArrayValue = json["orgUnitIds"].array {
                self.orgUnitIds = []
                for item in orgUnitIdsArrayValue {
                    if var orgUnitIds = orgUnitIds, let itemValue = item.string {
                        orgUnitIds.append(itemValue)
                    }
                }
            }
            
            if let categoryIdsArrayValue = json["categoryIds"].array {
                self.categoryIds = []
                for item in categoryIdsArrayValue {
                    if var categoryIds = categoryIds, let itemValue = item.string {
                        categoryIds.append(itemValue)
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
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let barcode = json["barcode"].string {
                self.barcode = barcode
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListItems.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let sortDescending = json["sortDescending"].bool {
                self.sortDescending = sortDescending
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
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let barcode = self.barcode {
                dictionary["barcode"] = barcode
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let sortDescending = self.sortDescending {
                dictionary["sortDescending"] = sortDescending
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
    var code: WsListItems.Code?
    var items: [WsListItems.Item]?

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
        if let code = WsListItems.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let itemsArrayValue = json["items"].array {
        self.items = []
        for item in itemsArrayValue {
            if let value = WsListItems.Item(json: item), var items = items {
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

enum SortBy: String {
    case BIZ_UNIT_NAME
    case ITEM_NUMBER
    case SIZE_SEQUENCE
    case SKU_NUMBER
    case LONG_DESC
    case SHORT_DESC
    case ITEM_CLASS
    case ITEM_TYPE
    case UNIT_OF_MEASURE
    case UNIT_OF_MEASURE_QUANTITY
}

enum Code: String {
    case SUCCESS
    case NOT_IMPLEMENTED
    case BARCODE_NOT_FOUND
    case FAILED
}

class Item: JSONSerializable {
    var item: ItemEntity?
    var versions: [ItemVersionEntity]?
    var barcodeVersion: ItemVersionEntity?
    var barcodeLot: LotEntity?
    var barcodeSerial: SerialEntity?

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
    
    self.item = ItemEntity(json: json["item"])
    
    if let versionsArrayValue = json["versions"].array {
        self.versions = []
        for item in versionsArrayValue {
            if let value = ItemVersionEntity(json: item), var versions = versions {
                versions.append(value)
            }
        }
    }
    
    self.barcodeVersion = ItemVersionEntity(json: json["barcodeVersion"])
    
    self.barcodeLot = LotEntity(json: json["barcodeLot"])
    
    self.barcodeSerial = SerialEntity(json: json["barcodeSerial"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let item = self.item {
        dictionary["item"] = item.asDictionary()
    }
    
    if let barcodeVersion = self.barcodeVersion {
        dictionary["barcodeVersion"] = barcodeVersion.asDictionary()
    }
    
    if let barcodeLot = self.barcodeLot {
        dictionary["barcodeLot"] = barcodeLot.asDictionary()
    }
    
    if let barcodeSerial = self.barcodeSerial {
        dictionary["barcodeSerial"] = barcodeSerial.asDictionary()
    }
    
    return dictionary
}
}

}
