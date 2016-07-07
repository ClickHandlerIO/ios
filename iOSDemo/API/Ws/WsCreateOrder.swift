import Foundation
import SwiftyJSON

struct WsCreateOrder {

    class Request: WsRequest {
        typealias Response = WsCreateOrder.Response
        
        var locationType: LocationType?
        var locationId: String?
        var bizUnitId: String?
        var opsOrgUnitId: String?
        var salesOrgUnitId: String?
        var orderReasonId: String?
        var itemClass: ItemClass?
        var sourceStartDate: Int?
        var deliverWindowStart: Int?
        var deliverWindowEnd: Int?
        var deliverToAddress: Address?
        var expirationCutoff: Int?
        
        class func getPath() -> String {
            return "/inventory/order/createorder"
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
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
            
            if let opsOrgUnitId = json["opsOrgUnitId"].string {
                self.opsOrgUnitId = opsOrgUnitId
            }
            
            if let salesOrgUnitId = json["salesOrgUnitId"].string {
                self.salesOrgUnitId = salesOrgUnitId
            }
            
            if let orderReasonId = json["orderReasonId"].string {
                self.orderReasonId = orderReasonId
            }
            
            if let itemClassStringValue = json["itemClass"].string {
                if let itemClass = ItemClass(rawValue: itemClassStringValue) {
                    self.itemClass = itemClass
                }
            }
            
            self.deliverToAddress = Address(json: json["deliverToAddress"])
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let locationType = self.locationType {
                dictionary["locationType"] = locationType.rawValue
            }
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let opsOrgUnitId = self.opsOrgUnitId {
                dictionary["opsOrgUnitId"] = opsOrgUnitId
            }
            
            if let salesOrgUnitId = self.salesOrgUnitId {
                dictionary["salesOrgUnitId"] = salesOrgUnitId
            }
            
            if let orderReasonId = self.orderReasonId {
                dictionary["orderReasonId"] = orderReasonId
            }
            
            if let itemClass = self.itemClass {
                dictionary["itemClass"] = itemClass.rawValue
            }
            
            if let deliverToAddress = self.deliverToAddress {
                dictionary["deliverToAddress"] = deliverToAddress.asDictionary()
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case LOCATION_TYPE_REQUIRED
    case LOCATION_ID_REQUIRED
    case OPS_OU_ID_REQUIRED
    case SALES_OU_ID_REQUIRED
    case ITEM_CLASS_REQUIRED
    case SOURCE_START_REQUIRED
    case WINDOW_START_REQUIRED
    case WINDOW_END_REQUIRED
    case DELIVERY_ADDRESS_REQUIRED
    case EXPIRATION_CUTOFF_REQUIRED
    case BIZ_UNIT_ID_REQUIRED
    case ORDER_REASON_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreateOrder.Code?
    var orderId: String?

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
        if let code = WsCreateOrder.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    return dictionary
}
}

}
