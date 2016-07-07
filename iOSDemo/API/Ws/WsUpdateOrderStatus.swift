import Foundation
import SwiftyJSON

struct WsUpdateOrderStatus {

    class Request: WsRequest {
        typealias Response = WsUpdateOrderStatus.Response
        
        var id: String?
        var orderStatus: OrderStatus?
        
        class func getPath() -> String {
            return "/inventory/order/updateorderstatus"
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
            
            if let orderStatusStringValue = json["orderStatus"].string {
                if let orderStatus = OrderStatus(rawValue: orderStatusStringValue) {
                    self.orderStatus = orderStatus
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let orderStatus = self.orderStatus {
                dictionary["orderStatus"] = orderStatus.rawValue
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsUpdateOrderStatus.Code?

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
        if let code = WsUpdateOrderStatus.Code(rawValue: codeStringValue) {
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
    case ORDER_ID_REQUIRED
    case STATUS_REQUIRED
    case NOT_FOUND
    case FAILED
}

}
