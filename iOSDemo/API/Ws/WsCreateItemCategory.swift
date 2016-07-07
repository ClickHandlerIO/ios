import Foundation
import SwiftyJSON

struct WsCreateItemCategory {

    class Request: WsRequest {
        typealias Response = WsCreateItemCategory.Response
        
        var bizUnitId: String?
        var opsOuId: String?
        var parentCategoryId: String?
        var name: String?
        var code: String?
        
        class func getPath() -> String {
            return "/catalogs/createitemcategory"
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
            
            if let opsOuId = json["opsOuId"].string {
                self.opsOuId = opsOuId
            }
            
            if let parentCategoryId = json["parentCategoryId"].string {
                self.parentCategoryId = parentCategoryId
            }
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let code = json["code"].string {
                self.code = code
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let opsOuId = self.opsOuId {
                dictionary["opsOuId"] = opsOuId
            }
            
            if let parentCategoryId = self.parentCategoryId {
                dictionary["parentCategoryId"] = parentCategoryId
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let code = self.code {
                dictionary["code"] = code
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case OPS_OU_ID_REQUIRED
    case NAME_REQUIRED
    case CODE_REQUIRED
    case LABEL_DEF_REQUIRED
    case LABEL_REQUIRED
    case BIZ_UNIT_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreateItemCategory.Code?
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
        if let code = WsCreateItemCategory.Code(rawValue: codeStringValue) {
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

}
