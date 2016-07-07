import Foundation
import SwiftyJSON

struct WsRemoveMemberCategory {

    class Request: WsRequest {
        typealias Response = WsRemoveMemberCategory.Response
        
        var itemId: String?
        var itemCategoryId: String?
        
        class func getPath() -> String {
            return "/inventory/relationship/itemtoitemcategory/removemembercategory"
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
            
            if let itemCategoryId = json["itemCategoryId"].string {
                self.itemCategoryId = itemCategoryId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            if let itemCategoryId = self.itemCategoryId {
                dictionary["itemCategoryId"] = itemCategoryId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsRemoveMemberCategory.Code?

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
        if let code = WsRemoveMemberCategory.Code(rawValue: codeStringValue) {
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
    case INVALID
    case ITEM_ID_REQUIRED
    case NOT_FOUND
    case ITEM_CAT_ID_REQUIRED
    case FAILED
}

}
