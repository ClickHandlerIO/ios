import Foundation
import SwiftyJSON

struct WsEditOrder {

    class Request: WsRequest {
        typealias Response = WsEditOrder.Response
        
        var id: String?
        var itemClass: ItemClass?
        var sourceStartDate: Int?
        var deliverWindowStart: Int?
        var deliverWindowEnd: Int?
        var deliverToAddress: Address?
        var expirationCutoff: Int?
        var poNumber: String?
        
        class func getPath() -> String {
            return "/inventory/order/editorder"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let itemClassStringValue = json["itemClass"].string {
                if let itemClass = ItemClass(rawValue: itemClassStringValue) {
                    self.itemClass = itemClass
                }
            }
            
            self.deliverToAddress = Address(json: json["deliverToAddress"])
            
            if let poNumber = json["poNumber"].string {
                self.poNumber = poNumber
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let itemClass = self.itemClass {
                dictionary["itemClass"] = itemClass.rawValue
            }
            
            if let deliverToAddress = self.deliverToAddress {
                dictionary["deliverToAddress"] = deliverToAddress.asDictionary()
            }
            
            if let poNumber = self.poNumber {
                dictionary["poNumber"] = poNumber
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case ORDER_ID_REQUIRED
    case NOT_FOUND
    case ITEM_CLASS_REQUIRED
    case SOURCE_START_REQUIRED
    case WINDOW_START_REQUIRED
    case WINDOW_END_REQUIRED
    case DELIVERY_ADDRESS_REQUIRED
    case EXPIRATION_CUTOFF_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsEditOrder.Code?

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
        if let code = WsEditOrder.Code(rawValue: codeStringValue) {
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

}
