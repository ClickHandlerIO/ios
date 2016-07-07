import Foundation
import SwiftyJSON

struct WsAdHocCreateShipment {

    class Request: WsRequest {
        typealias Response = WsAdHocCreateShipment.Response
        
        var fromLocationType: LocationType?
        var fromLocationId: String?
        var toLocationType: LocationType?
        var toLocationId: String?
        var stockPacks: [WsAdHocCreateShipment.StockPack]?
        
        class func getPath() -> String {
            return "/inventory/shipping/shipment/adhoccreateshipment"
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
            
            if let fromLocationTypeStringValue = json["fromLocationType"].string {
                if let fromLocationType = LocationType(rawValue: fromLocationTypeStringValue) {
                    self.fromLocationType = fromLocationType
                }
            }
            
            if let fromLocationId = json["fromLocationId"].string {
                self.fromLocationId = fromLocationId
            }
            
            if let toLocationTypeStringValue = json["toLocationType"].string {
                if let toLocationType = LocationType(rawValue: toLocationTypeStringValue) {
                    self.toLocationType = toLocationType
                }
            }
            
            if let toLocationId = json["toLocationId"].string {
                self.toLocationId = toLocationId
            }
            
            if let stockPacksArrayValue = json["stockPacks"].array {
                self.stockPacks = []
                for item in stockPacksArrayValue {
                    if let value = WsAdHocCreateShipment.StockPack(json: item), var stockPacks = stockPacks {
                        stockPacks.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let fromLocationType = self.fromLocationType {
                dictionary["fromLocationType"] = fromLocationType.rawValue
            }
            
            if let fromLocationId = self.fromLocationId {
                dictionary["fromLocationId"] = fromLocationId
            }
            
            if let toLocationType = self.toLocationType {
                dictionary["toLocationType"] = toLocationType.rawValue
            }
            
            if let toLocationId = self.toLocationId {
                dictionary["toLocationId"] = toLocationId
            }
            
            return dictionary
        }
    }

class StockPack: JSONSerializable {
    var stockId: String?
    var packId: String?

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
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
    
    if let packId = json["packId"].string {
        self.packId = packId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    if let packId = self.packId {
        dictionary["packId"] = packId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case NOT_IMPL
    case FROM_LOCATION_TYPE_REQUIRED
    case TO_LOCATION_TYPE_REQUIRED
    case FROM_LOCATION_ID_REQUIRED
    case TO_LOCATION_ID_REQUIRED
    case STOCK_PACK_REQUIRED
    case MISSING_STOCK_ID
    case MISSING_PACKAGE_ID
    case FAILED
}

class Response: JSONSerializable {
    var code: WsAdHocCreateShipment.Code?
    var shipmentId: String?

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
        if let code = WsAdHocCreateShipment.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let shipmentId = json["shipmentId"].string {
        self.shipmentId = shipmentId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let shipmentId = self.shipmentId {
        dictionary["shipmentId"] = shipmentId
    }
    
    return dictionary
}
}

}
