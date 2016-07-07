import Foundation
import SwiftyJSON

struct WsListShipments {

    class Request: WsRequest {
        typealias Response = WsListShipments.Response
        
        var fromLocationIds: [String]?
        var toLocationIds: [String]?
        var statuses: [ShipmentStatus]?
        var sortBy: WsListShipments.SortBy?
        var sortDescending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/shipment/list"
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
            
            if let statusesArrayValue = json["statuses"].array {
                self.statuses = []
                for item in statusesArrayValue {
                    if let value = ShipmentStatus(rawValue: item.stringValue), var statuses = statuses {
                        statuses.append(value)
                    }
                }
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListShipments.SortBy(rawValue: sortByStringValue) {
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
    var code: WsListShipments.Code?
    var shipments: [WsListShipments.Shipment]?

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
        if let code = WsListShipments.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let shipmentsArrayValue = json["shipments"].array {
        self.shipments = []
        for item in shipmentsArrayValue {
            if let value = WsListShipments.Shipment(json: item), var shipments = shipments {
                shipments.append(value)
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

class Shipment: JSONSerializable {
    var shipment: ShipmentEntity?
    var orderId: String?
    var orderNumber: String?
    var fromLocation: Location?
    var toLocation: Location?

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
    
    self.shipment = ShipmentEntity(json: json["shipment"])
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let orderNumber = json["orderNumber"].string {
        self.orderNumber = orderNumber
    }
    
    self.fromLocation = Location(json: json["fromLocation"])
    
    self.toLocation = Location(json: json["toLocation"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let shipment = self.shipment {
        dictionary["shipment"] = shipment.asDictionary()
    }
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let orderNumber = self.orderNumber {
        dictionary["orderNumber"] = orderNumber
    }
    
    if let fromLocation = self.fromLocation {
        dictionary["fromLocation"] = fromLocation.asDictionary()
    }
    
    if let toLocation = self.toLocation {
        dictionary["toLocation"] = toLocation.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
}

enum SortBy: String {
    case NUMBER
    case STATUS
    case FROM
    case TO
}

}
