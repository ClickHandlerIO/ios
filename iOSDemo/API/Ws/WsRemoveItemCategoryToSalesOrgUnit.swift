import Foundation
import SwiftyJSON

struct WsRemoveItemCategoryToSalesOrgUnit {

    class Request: WsRequest {
        typealias Response = WsRemoveItemCategoryToSalesOrgUnit.Response
        
        var id: String?
        var itemCategoryId: String?
        var salesOuId: String?
        
        class func getPath() -> String {
            return "/catalogs/relationship/removeitemcategorytosalesorgunit"
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
            
            if let itemCategoryId = json["itemCategoryId"].string {
                self.itemCategoryId = itemCategoryId
            }
            
            if let salesOuId = json["salesOuId"].string {
                self.salesOuId = salesOuId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let itemCategoryId = self.itemCategoryId {
                dictionary["itemCategoryId"] = itemCategoryId
            }
            
            if let salesOuId = self.salesOuId {
                dictionary["salesOuId"] = salesOuId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsRemoveItemCategoryToSalesOrgUnit.Code?

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
        if let code = WsRemoveItemCategoryToSalesOrgUnit.Code(rawValue: codeStringValue) {
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
    case NOT_FOUND
    case INVALID
    case ID_OR_ID_SET_REQUIRED
    case FAILED
}

}
