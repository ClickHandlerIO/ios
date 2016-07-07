import Foundation
import SwiftyJSON

struct WsCreateOrderReason {

    class Request: WsRequest {
        typealias Response = WsCreateOrderReason.Response
        
        var orgId: String?
        var bizUnitId: String?
        var salesOrgUnitId: String?
        var name: String?
        var reasonGroup: OrderReasonGroup?
        var erp: Bool?
        
        class func getPath() -> String {
            return "/inventory/shipping/orderreason/create"
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
            
            if let orgId = json["orgId"].string {
                self.orgId = orgId
            }
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
            
            if let salesOrgUnitId = json["salesOrgUnitId"].string {
                self.salesOrgUnitId = salesOrgUnitId
            }
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let reasonGroupStringValue = json["reasonGroup"].string {
                if let reasonGroup = OrderReasonGroup(rawValue: reasonGroupStringValue) {
                    self.reasonGroup = reasonGroup
                }
            }
            
            if let erp = json["erp"].bool {
                self.erp = erp
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let orgId = self.orgId {
                dictionary["orgId"] = orgId
            }
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let salesOrgUnitId = self.salesOrgUnitId {
                dictionary["salesOrgUnitId"] = salesOrgUnitId
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let reasonGroup = self.reasonGroup {
                dictionary["reasonGroup"] = reasonGroup.rawValue
            }
            
            if let erp = self.erp {
                dictionary["erp"] = erp
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateOrderReason.Code?
    var id: String?

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
        if let code = WsCreateOrderReason.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case CONTEXT_REQUIRED
    case ORG_ID_REQUIRED
    case BIZ_UNIT_ID_REQUIRED
    case SALES_OU_ID_REQUIRED
    case NAME_REQUIRED
    case REASON_GROUP_REQUIRED
    case ALREADY_EXISTS
    case FAILED
}

}
