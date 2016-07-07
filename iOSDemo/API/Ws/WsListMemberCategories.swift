import Foundation
import SwiftyJSON

struct WsListMemberCategories {

    class Request: WsRequest {
        typealias Response = WsListMemberCategories.Response
        
        var itemId: String?
        
        class func getPath() -> String {
            return "/inventory/relationship/itemtoitemcategory/listmembercategories"
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
            
            if let itemId = json["itemId"].string {
                self.itemId = itemId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListMemberCategories.Code?
    var categories: [ItemCategoryEntity]?

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
        if let code = WsListMemberCategories.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let categoriesArrayValue = json["categories"].array {
        self.categories = []
        for item in categoriesArrayValue {
            if let value = ItemCategoryEntity(json: item), var categories = categories {
                categories.append(value)
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
    case ITEM_ID_REQUIRED
    case ITEM_CATEGORY_ID_REQUIRED
    case ITEM_NOT_FOUND
    case ITEM_CATEGORY_NOT_FOUND
    case INVALID
    case FAILED
}

}
