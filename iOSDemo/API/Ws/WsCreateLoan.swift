import Foundation
import SwiftyJSON

struct WsCreateLoan {

    class Request: WsRequest {
        typealias Response = WsCreateLoan.Response
        
        var locationType: LocationType?
        var locationId: String?
        var bizUnitId: String?
        var opsOrgUnitId: String?
        var salesOrgUnitId: String?
        var expirationDate: Int?
        var itemClass: ItemClass?
        
        class func getPath() -> String {
            return "/inventory/loan/createloan"
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
            
            if let itemClassStringValue = json["itemClass"].string {
                if let itemClass = ItemClass(rawValue: itemClassStringValue) {
                    self.itemClass = itemClass
                }
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
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let opsOrgUnitId = self.opsOrgUnitId {
                dictionary["opsOrgUnitId"] = opsOrgUnitId
            }
            
            if let salesOrgUnitId = self.salesOrgUnitId {
                dictionary["salesOrgUnitId"] = salesOrgUnitId
            }
            
            if let itemClass = self.itemClass {
                dictionary["itemClass"] = itemClass.rawValue
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
    case EXPIRATION_REQUIRED
    case ITEM_CLASS_REQUIRED
    case BIZ_UNIT_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreateLoan.Code?
    var loanId: String?

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
        if let code = WsCreateLoan.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let loanId = json["loanId"].string {
        self.loanId = loanId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let loanId = self.loanId {
        dictionary["loanId"] = loanId
    }
    
    return dictionary
}
}

}
