import Foundation
import SwiftyJSON

struct WsPrepareShipment {

    class Request: WsRequest {
        typealias Response = WsPrepareShipment.Response
        
        var shipmentId: String?
        var packageTrackingList: [WsPrepareShipment.PackTrack]?
        
        class func getPath() -> String {
            return "/inventory/shipping/shipment/prepareshipment"
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
            
            if let packageTrackingListArrayValue = json["packageTrackingList"].array {
                self.packageTrackingList = []
                for item in packageTrackingListArrayValue {
                    if let value = WsPrepareShipment.PackTrack(json: item), var packageTrackingList = packageTrackingList {
                        packageTrackingList.append(value)
                    }
                }
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

class Response: JSONSerializable {
    var code: WsPrepareShipment.Code?

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
        if let code = WsPrepareShipment.Code(rawValue: codeStringValue) {
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
    case NOT_FOUND
    case PACKAGES_NOT_FOUND
    case PACKAGES_NOT_IN_PROPER_STATUS
    case FAILED
}

class PackTrack: JSONSerializable {
    var packageId: String?
    var trackingNumber: String?

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
    
    if let trackingNumber = json["trackingNumber"].string {
        self.trackingNumber = trackingNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let packageId = self.packageId {
        dictionary["packageId"] = packageId
    }
    
    if let trackingNumber = self.trackingNumber {
        dictionary["trackingNumber"] = trackingNumber
    }
    
    return dictionary
}
}

}
