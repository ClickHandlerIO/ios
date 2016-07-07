import Foundation
import SwiftyJSON

struct WsListOrderReasons {

    class Request: WsRequest {
        typealias Response = WsListOrderReasons.Response
        
        var bizUnitId: String?
        var opsOrgUnitId: String?
        var salesOrgUnitId: String?
        var search: String?
        
        class func getPath() -> String {
            return "/inventory/order/listorderreasons"
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
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
            
            if let opsOrgUnitId = json["opsOrgUnitId"].string {
                self.opsOrgUnitId = opsOrgUnitId
            }
            
            if let salesOrgUnitId = json["salesOrgUnitId"].string {
                self.salesOrgUnitId = salesOrgUnitId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let opsOrgUnitId = self.opsOrgUnitId {
                dictionary["opsOrgUnitId"] = opsOrgUnitId
            }
            
            if let salesOrgUnitId = self.salesOrgUnitId {
                dictionary["salesOrgUnitId"] = salesOrgUnitId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListOrderReasons.Code?
    var reasons: [OrderReasonEntity]?

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
        if let code = WsListOrderReasons.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let reasonsArrayValue = json["reasons"].array {
        self.reasons = []
        for item in reasonsArrayValue {
            if let value = OrderReasonEntity(json: item), var reasons = reasons {
                reasons.append(value)
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

enum Code: String {
    case SUCCESS
    case BIZ_UNIT_ID_REQUIRED
    case OPS_ORG_UNIT_ID_REQUIRED
    case SALES_ORG_UNIT_ID_REQUIRED
    case FAILED
}

}
