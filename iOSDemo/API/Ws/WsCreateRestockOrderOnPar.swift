import Foundation
import SwiftyJSON

struct WsCreateRestockOrderOnPar {

    class Request: WsRequest {
        typealias Response = WsCreateRestockOrderOnPar.Response
        
        var locationType: LocationType?
        var locationId: String?
        
        class func getPath() -> String {
            return "/inventory/order/createrestockorderonpar"
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
            
            if let locationTypeStringValue = json["locationType"].string {
                if let locationType = LocationType(rawValue: locationTypeStringValue) {
                    self.locationType = locationType
                }
            }
            
            if let locationId = json["locationId"].string {
                self.locationId = locationId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let locationType = self.locationType {
                dictionary["locationType"] = locationType.rawValue
            }
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateRestockOrderOnPar.Code?
    var restockOrderId: String?

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
        if let code = WsCreateRestockOrderOnPar.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let restockOrderId = json["restockOrderId"].string {
        self.restockOrderId = restockOrderId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let restockOrderId = self.restockOrderId {
        dictionary["restockOrderId"] = restockOrderId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case LOCATION_TYPE_REQUIRED
    case LOCATION_ID_REQUIRED
    case ORDER_REASON_NOT_FOUND
    case INVALID_LOCATION_TYPE
    case LOCATION_NOT_FOUND
    case FAILED
}

}
