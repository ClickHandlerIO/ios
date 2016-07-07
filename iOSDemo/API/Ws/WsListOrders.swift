import Foundation
import SwiftyJSON

struct WsListOrders {

    class Request: WsRequest {
        typealias Response = WsListOrders.Response
        
        var inventoryLocations: [String]?
        var orderStatuses: [OrderStatus]?
        var orderReasons: [OrderReasonGroup]?
        var locationTypes: [LocationType]?
        var sourceStartMin: Int?
        var sourceStartMax: Int?
        var deliveryWindowStartMin: Int?
        var deliveryWindowStartMax: Int?
        var deliveryWindowEndMin: Int?
        var deliveryWindowEndMax: Int?
        var expirationCutoffMin: Int?
        var expirationCutoffMax: Int?
        var hasErpError: Bool?
        var sortBy: WsListOrders.SortBy?
        var sortDescending: Bool?
        
        class func getPath() -> String {
            return "/inventory/order/listorders"
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
            
            if let inventoryLocationsArrayValue = json["inventoryLocations"].array {
                self.inventoryLocations = []
                for item in inventoryLocationsArrayValue {
                    if var inventoryLocations = inventoryLocations, let itemValue = item.string {
                        inventoryLocations.append(itemValue)
                    }
                }
            }
            
            if let orderStatusesArrayValue = json["orderStatuses"].array {
                self.orderStatuses = []
                for item in orderStatusesArrayValue {
                    if let value = OrderStatus(rawValue: item.stringValue), var orderStatuses = orderStatuses {
                        orderStatuses.append(value)
                    }
                }
            }
            
            if let orderReasonsArrayValue = json["orderReasons"].array {
                self.orderReasons = []
                for item in orderReasonsArrayValue {
                    if let value = OrderReasonGroup(rawValue: item.stringValue), var orderReasons = orderReasons {
                        orderReasons.append(value)
                    }
                }
            }
            
            if let locationTypesArrayValue = json["locationTypes"].array {
                self.locationTypes = []
                for item in locationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var locationTypes = locationTypes {
                        locationTypes.append(value)
                    }
                }
            }
            
            if let hasErpError = json["hasErpError"].bool {
                self.hasErpError = hasErpError
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListOrders.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let sortDescending = json["sortDescending"].bool {
                self.sortDescending = sortDescending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let hasErpError = self.hasErpError {
                dictionary["hasErpError"] = hasErpError
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let sortDescending = self.sortDescending {
                dictionary["sortDescending"] = sortDescending
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

enum SortBy: String {
    case LOCATION_NAME
    case NUMBER
    case STATUS
    case ITEM_CLASS
    case SOURCE_START_DATE
    case DELIVER_WINDOW_START
    case DELIVER_WINDOW_END
    case EXPIRATION_CUTOFF
    case REASON
}

class Order: JSONSerializable {
    var orderEntity: OrderHeaderEntity?
    var orderReasonEntity: OrderReasonEntity?
    var locationName: String?

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
    
    self.orderEntity = OrderHeaderEntity(json: json["orderEntity"])
    
    self.orderReasonEntity = OrderReasonEntity(json: json["orderReasonEntity"])
    
    if let locationName = json["locationName"].string {
        self.locationName = locationName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orderEntity = self.orderEntity {
        dictionary["orderEntity"] = orderEntity.asDictionary()
    }
    
    if let orderReasonEntity = self.orderReasonEntity {
        dictionary["orderReasonEntity"] = orderReasonEntity.asDictionary()
    }
    
    if let locationName = self.locationName {
        dictionary["locationName"] = locationName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListOrders.Code?
    var orders: [WsListOrders.Order]?

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
        if let code = WsListOrders.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let ordersArrayValue = json["orders"].array {
        self.orders = []
        for item in ordersArrayValue {
            if let value = WsListOrders.Order(json: item), var orders = orders {
                orders.append(value)
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
