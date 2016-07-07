import Foundation
import SwiftyJSON

struct WsGetShipmentDetail {

    class Request: WsRequest {
        typealias Response = WsGetShipmentDetail.Response
        
        var shipmentId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/shipment/getshipmentdetail"
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
            
            if let shipmentId = json["shipmentId"].string {
                self.shipmentId = shipmentId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let shipmentId = self.shipmentId {
                dictionary["shipmentId"] = shipmentId
            }
            
            return dictionary
        }
    }

class ShipmentDetail: JSONSerializable {
    var id: String?
    var shipmentReference: String?
    var shipmentNumber: String?
    var shipmentStatus: ShipmentStatus?
    var releaseDate: Int?
    var orderId: String?
    var orderNumber: String?
    var fromLocationType: LocationType?
    var fromLocationId: String?
    var fromLocationName: String?
    var toLocationType: LocationType?
    var toLocationId: String?
    var toLocationName: String?
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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let shipmentReference = json["shipmentReference"].string {
        self.shipmentReference = shipmentReference
    }
    
    if let shipmentNumber = json["shipmentNumber"].string {
        self.shipmentNumber = shipmentNumber
    }
    
    if let shipmentStatusStringValue = json["shipmentStatus"].string {
        if let shipmentStatus = ShipmentStatus(rawValue: shipmentStatusStringValue) {
            self.shipmentStatus = shipmentStatus
        }
    }
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let orderNumber = json["orderNumber"].string {
        self.orderNumber = orderNumber
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
    
    if let toLocationTypeStringValue = json["toLocationType"].string {
        if let toLocationType = LocationType(rawValue: toLocationTypeStringValue) {
            self.toLocationType = toLocationType
        }
    }
    
    if let toLocationId = json["toLocationId"].string {
        self.toLocationId = toLocationId
    }
    
    if let toLocationName = json["toLocationName"].string {
        self.toLocationName = toLocationName
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
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let shipmentReference = self.shipmentReference {
        dictionary["shipmentReference"] = shipmentReference
    }
    
    if let shipmentNumber = self.shipmentNumber {
        dictionary["shipmentNumber"] = shipmentNumber
    }
    
    if let shipmentStatus = self.shipmentStatus {
        dictionary["shipmentStatus"] = shipmentStatus.rawValue
    }
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let orderNumber = self.orderNumber {
        dictionary["orderNumber"] = orderNumber
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
    
    if let toLocationType = self.toLocationType {
        dictionary["toLocationType"] = toLocationType.rawValue
    }
    
    if let toLocationId = self.toLocationId {
        dictionary["toLocationId"] = toLocationId
    }
    
    if let toLocationName = self.toLocationName {
        dictionary["toLocationName"] = toLocationName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsGetShipmentDetail.Code?
    var shipmentDetail: WsGetShipmentDetail.ShipmentDetail?

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
        if let code = WsGetShipmentDetail.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.shipmentDetail = WsGetShipmentDetail.ShipmentDetail(json: json["shipmentDetail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let shipmentDetail = self.shipmentDetail {
        dictionary["shipmentDetail"] = shipmentDetail.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case SHIPMENT_ID_REQUIRED
    case FAILED
}

}
