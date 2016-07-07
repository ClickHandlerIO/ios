import Foundation
import SwiftyJSON

struct WsUpdateShipmentStatus {

    class Request: WsRequest {
        typealias Response = WsUpdateShipmentStatus.Response
        
        var shipmentId: String?
        var status: ShipmentStatus?
        
        class func getPath() -> String {
            return "/inventory/shipping/shipment/updateshipmentstatus"
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
            
            if let statusStringValue = json["status"].string {
                if let status = ShipmentStatus(rawValue: statusStringValue) {
                    self.status = status
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let shipmentId = self.shipmentId {
                dictionary["shipmentId"] = shipmentId
            }
            
            if let status = self.status {
                dictionary["status"] = status.rawValue
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsUpdateShipmentStatus.Code?

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
        if let code = WsUpdateShipmentStatus.Code(rawValue: codeStringValue) {
            self.code = code
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
    case SHIPMENT_ID_REQUIRED
    case STATUS_REQUIRED
    case NOT_IMPLEMENTED
    case NOT_FOUND
    case INVALID_REQUEST
    case INVALID_PACKAGE_STATUS
    case FAILED
}

}
