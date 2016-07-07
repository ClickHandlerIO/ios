import Foundation
import SwiftyJSON

struct WsListLostFoundStock {

    class Request: WsRequest {
        typealias Response = WsListLostFoundStock.Response
        
        var itemIds: [String]?
        var locationIds: [String]?
        var itemClasses: [ItemClass]?
        var itemTypes: [ItemType]?
        
        class func getPath() -> String {
            return "/inventory/stock/lostfound/listlostfound"
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
            
            if let itemIdsArrayValue = json["itemIds"].array {
                self.itemIds = []
                for item in itemIdsArrayValue {
                    if var itemIds = itemIds, let itemValue = item.string {
                        itemIds.append(itemValue)
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListLostFoundStock.Code?
    var matchedStock: [StockMatch]?
    var lostStockUnmatched: [Stock]?
    var foundStockUnmatched: [Stock]?

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
        if let code = WsListLostFoundStock.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let matchedStockArrayValue = json["matchedStock"].array {
        self.matchedStock = []
        for item in matchedStockArrayValue {
            if let value = StockMatch(json: item), var matchedStock = matchedStock {
                matchedStock.append(value)
            }
        }
    }
    
    if let lostStockUnmatchedArrayValue = json["lostStockUnmatched"].array {
        self.lostStockUnmatched = []
        for item in lostStockUnmatchedArrayValue {
            if let value = Stock(json: item), var lostStockUnmatched = lostStockUnmatched {
                lostStockUnmatched.append(value)
            }
        }
    }
    
    if let foundStockUnmatchedArrayValue = json["foundStockUnmatched"].array {
        self.foundStockUnmatched = []
        for item in foundStockUnmatchedArrayValue {
            if let value = Stock(json: item), var foundStockUnmatched = foundStockUnmatched {
                foundStockUnmatched.append(value)
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

enum Code: String {
    case SUCCESS
    case CONTEXT_REQUIRED
    case FAILED
}

}
