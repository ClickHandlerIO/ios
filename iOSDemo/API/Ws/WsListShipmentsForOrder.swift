import Foundation
import SwiftyJSON

struct WsListShipmentsForOrder {

    class Request: WsRequest {
        typealias Response = WsListShipmentsForOrder.Response
        
        var orderId: String?
        var sortBy: WsListShipmentsForOrder.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/inventory/order/listshipmentsfororder"
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
                if let sortBy = WsListShipmentsForOrder.SortBy(rawValue: sortByStringValue) {
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

enum Code: String {
    case SUCCESS
    case ORDER_ID_REQUIRED
    case FAILED
}

enum SortBy: String {
    case SHIPMENT_NUMBER
    case SHIPMENT_STATUS
    case LOCATION
    case PICK_NUMBER
}

class Shipment: JSONSerializable {
    var id: String?
    var number: String?
    var reference: String?
    var status: ShipmentStatus?
    var pickCount: Int?
    var fromLocationType: LocationType?
    var fromLocationId: String?
    var fromLocationName: String?
    var openPicks: Int?

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
    
    if let number = json["number"].string {
        self.number = number
    }
    
    if let reference = json["reference"].string {
        self.reference = reference
    }
    
    if let statusStringValue = json["status"].string {
        if let status = ShipmentStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
    
    if let pickCount = json["pickCount"].int {
        self.pickCount = pickCount
    }
    
    if let fromLocationTypeStringValue = json["fromLocationType"].string {
        if let fromLocationType = LocationType(rawValue: fromLocationTypeStringValue) {
            self.fromLocationType = fromLocationType
        }
    }
    
    if let fromLocationId = json["fromLocationId"].string {
        self.fromLocationId = fromLocationId
    }
    
    if let fromLocationName = json["fromLocationName"].string {
        self.fromLocationName = fromLocationName
    }
    
    if let openPicks = json["openPicks"].int {
        self.openPicks = openPicks
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let number = self.number {
        dictionary["number"] = number
    }
    
    if let reference = self.reference {
        dictionary["reference"] = reference
    }
    
    if let status = self.status {
        dictionary["status"] = status.rawValue
    }
    
    if let pickCount = self.pickCount {
        dictionary["pickCount"] = pickCount
    }
    
    if let fromLocationType = self.fromLocationType {
        dictionary["fromLocationType"] = fromLocationType.rawValue
    }
    
    if let fromLocationId = self.fromLocationId {
        dictionary["fromLocationId"] = fromLocationId
    }
    
    if let fromLocationName = self.fromLocationName {
        dictionary["fromLocationName"] = fromLocationName
    }
    
    if let openPicks = self.openPicks {
        dictionary["openPicks"] = openPicks
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListShipmentsForOrder.Code?
    var shipments: [WsListShipmentsForOrder.Shipment]?

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
        if let code = WsListShipmentsForOrder.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let shipmentsArrayValue = json["shipments"].array {
        self.shipments = []
        for item in shipmentsArrayValue {
            if let value = WsListShipmentsForOrder.Shipment(json: item), var shipments = shipments {
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

}
