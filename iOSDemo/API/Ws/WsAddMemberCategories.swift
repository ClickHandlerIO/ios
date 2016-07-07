import Foundation
import SwiftyJSON

struct WsAddMemberCategories {

    class Request: WsRequest {
        typealias Response = WsAddMemberCategories.Response
        
        var itemId: String?
        var itemCategoryIds: [String]?
        
        class func getPath() -> String {
            return "/inventory/relationship/itemtoitemcategory/addmembercategories"
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
            
            if let itemCategoryIdsArrayValue = json["itemCategoryIds"].array {
                self.itemCategoryIds = []
                for item in itemCategoryIdsArrayValue {
                    if var itemCategoryIds = itemCategoryIds, let itemValue = item.string {
                        itemCategoryIds.append(itemValue)
                    }
                }
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
    var code: WsAddMemberCategories.Code?

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
        if let code = WsAddMemberCategories.Code(rawValue: codeStringValue) {
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
    case ITEM_ID_REQUIRED
    case ITEM_CATEGORY_ID_REQUIRED
    case ITEM_NOT_FOUND
    case ITEM_CATEGORY_NOT_FOUND
    case INVALID
    case FAILED
}

}
