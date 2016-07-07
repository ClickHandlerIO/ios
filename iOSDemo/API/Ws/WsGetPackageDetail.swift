import Foundation
import SwiftyJSON

struct WsGetPackageDetail {

    class Request: WsRequest {
        typealias Response = WsGetPackageDetail.Response
        
        var packageId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/getpackagedetail"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let packageId = self.packageId {
                dictionary["packageId"] = packageId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetPackageDetail.Code?
    var packageDetail: WsGetPackageDetail.PackageDetail?

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
        if let code = WsGetPackageDetail.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.packageDetail = WsGetPackageDetail.PackageDetail(json: json["packageDetail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let packageDetail = self.packageDetail {
        dictionary["packageDetail"] = packageDetail.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case PACKAGE_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

class PackageDetail: JSONSerializable {
    var id: String?
    var packageNumber: String?
    var trackingNumber: String?
    var packageStatus: PackageStatus?
    var shipmentId: String?
    var shipmentNumber: String?
    var orderId: String?
    var orderNumber: String?
    var fromLocationType: LocationType?
    var fromLocationId: String?
    var fromLocation: Location?
    var toLocationType: LocationType?
    var toLocationId: String?
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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let packageNumber = json["packageNumber"].string {
        self.packageNumber = packageNumber
    }
    
    if let trackingNumber = json["trackingNumber"].string {
        self.trackingNumber = trackingNumber
    }
    
    if let packageStatusStringValue = json["packageStatus"].string {
        if let packageStatus = PackageStatus(rawValue: packageStatusStringValue) {
            self.packageStatus = packageStatus
        }
    }
    
    if let shipmentId = json["shipmentId"].string {
        self.shipmentId = shipmentId
    }
    
    if let shipmentNumber = json["shipmentNumber"].string {
        self.shipmentNumber = shipmentNumber
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
    
    self.fromLocation = Location(json: json["fromLocation"])
    
    if let toLocationTypeStringValue = json["toLocationType"].string {
        if let toLocationType = LocationType(rawValue: toLocationTypeStringValue) {
            self.toLocationType = toLocationType
        }
    }
    
    if let toLocationId = json["toLocationId"].string {
        self.toLocationId = toLocationId
    }
    
    self.toLocation = Location(json: json["toLocation"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let packageNumber = self.packageNumber {
        dictionary["packageNumber"] = packageNumber
    }
    
    if let trackingNumber = self.trackingNumber {
        dictionary["trackingNumber"] = trackingNumber
    }
    
    if let packageStatus = self.packageStatus {
        dictionary["packageStatus"] = packageStatus.rawValue
    }
    
    if let shipmentId = self.shipmentId {
        dictionary["shipmentId"] = shipmentId
    }
    
    if let shipmentNumber = self.shipmentNumber {
        dictionary["shipmentNumber"] = shipmentNumber
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
    
    if let fromLocation = self.fromLocation {
        dictionary["fromLocation"] = fromLocation.asDictionary()
    }
    
    if let toLocationType = self.toLocationType {
        dictionary["toLocationType"] = toLocationType.rawValue
    }
    
    if let toLocationId = self.toLocationId {
        dictionary["toLocationId"] = toLocationId
    }
    
    if let toLocation = self.toLocation {
        dictionary["toLocation"] = toLocation.asDictionary()
    }
    
    return dictionary
}
}

}
