import Foundation
import SwiftyJSON

struct WsListPackages {

    class Request: WsRequest {
        typealias Response = WsListPackages.Response
        
        var opsOrgUnitIds: [String]?
        var salesOrgUnitIds: [String]?
        var anyOrgUnitIds: [String]?
        var orderIds: [String]?
        var shipmentIds: [String]?
        var fromLocationTypes: [LocationType]?
        var fromLocationIds: [String]?
        var toLocationTypes: [LocationType]?
        var toLocationIds: [String]?
        var anyLocationTypes: [LocationType]?
        var anyLocationIds: [String]?
        var packageStatuses: [PackageStatus]?
        var stockIds: [String]?
        var itemIds: [String]?
        var sortBy: WsListPackages.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/listpackages"
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
            
            if let packageStatusesArrayValue = json["packageStatuses"].array {
                self.packageStatuses = []
                for item in packageStatusesArrayValue {
                    if let value = PackageStatus(rawValue: item.stringValue), var packageStatuses = packageStatuses {
                        packageStatuses.append(value)
                    }
                }
            }
            
            if let stockIdsArrayValue = json["stockIds"].array {
                self.stockIds = []
                for item in stockIdsArrayValue {
                    if var stockIds = stockIds, let itemValue = item.string {
                        stockIds.append(itemValue)
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
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListPackages.SortBy(rawValue: sortByStringValue) {
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
    case PACKAGE_NUMBER
    case PACKAGE_STATUS
    case SHIPMENT_NUMBER
    case ORDER_NUMBER
    case FROM_LOCATION
    case TO_LOCATION
}

class Response: JSONSerializable {
    var code: WsListPackages.Code?
    var packages: [Pack]?

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
        if let code = WsListPackages.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let packagesArrayValue = json["packages"].array {
        self.packages = []
        for item in packagesArrayValue {
            if let value = Pack(json: item), var packages = packages {
                packages.append(value)
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
