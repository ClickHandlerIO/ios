import Foundation
import SwiftyJSON

struct WsAddItemCategoryToSalesOrgUnit {

    class Request: WsRequest {
        typealias Response = WsAddItemCategoryToSalesOrgUnit.Response
        
        var itemCategoryId: String?
        var salesOuId: String?
        
        class func getPath() -> String {
            return "/catalogs/relationship/additemcategorytosalesorgunit"
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
            
            if let itemCategoryId = json["itemCategoryId"].string {
                self.itemCategoryId = itemCategoryId
            }
            
            if let salesOuId = json["salesOuId"].string {
                self.salesOuId = salesOuId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemCategoryId = self.itemCategoryId {
                dictionary["itemCategoryId"] = itemCategoryId
            }
            
            if let salesOuId = self.salesOuId {
                dictionary["salesOuId"] = salesOuId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NOT_FOUND
    case CATEGORY_ID_REQUIRED
    case ORG_UNIT_ID_REQUIRED
    case CATEGORY_NOT_FOUND
    case ORG_UNIT_NOT_FOUND
    case INVALID
    case FAILED
}

class Response: JSONSerializable {
    var code: WsAddItemCategoryToSalesOrgUnit.Code?

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
        if let code = WsAddItemCategoryToSalesOrgUnit.Code(rawValue: codeStringValue) {
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
