import Foundation
import SwiftyJSON

struct WsListStockForPackage {

    class Request: WsRequest {
        typealias Response = WsListStockForPackage.Response
        
        var packageId: String?
        var sortBy: WsListStockForPackage.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/liststockforpackage"
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
            
            if let packageId = json["packageId"].string {
                self.packageId = packageId
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListStockForPackage.SortBy(rawValue: sortByStringValue) {
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
            
            if let packageId = self.packageId {
                dictionary["packageId"] = packageId
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

enum Code: String {
    case SUCCESS
    case PACKAGE_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListStockForPackage.Code?
    var stock: [StockLite]?

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
        if let code = WsListStockForPackage.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let stockArrayValue = json["stock"].array {
        self.stock = []
        for item in stockArrayValue {
            if let value = StockLite(json: item), var stock = stock {
                stock.append(value)
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
    case ITEM_NUMBER
    case ITEM_TYPE
    case ITEM_CLASS
    case LOT
    case SERIAL
}

}
