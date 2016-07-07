import Foundation
import SwiftyJSON

struct WsListItemCategories {

    class Request: WsRequest {
        typealias Response = WsListItemCategories.Response
        
        var parentCategoryId: String?
        
        class func getPath() -> String {
            return "/catalogs/listitemcategories"
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
            
            if let parentCategoryId = json["parentCategoryId"].string {
                self.parentCategoryId = parentCategoryId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let parentCategoryId = self.parentCategoryId {
                dictionary["parentCategoryId"] = parentCategoryId
            }
            
            return dictionary
        }
    }

class ItemCategory: JSONSerializable {
    var id: String?
    var name: String?
    var hasChildren: Bool?

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
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let hasChildren = json["hasChildren"].bool {
        self.hasChildren = hasChildren
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let hasChildren = self.hasChildren {
        dictionary["hasChildren"] = hasChildren
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListItemCategories.Code?
    var itemCategories: [WsListItemCategories.ItemCategory]?

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
        if let code = WsListItemCategories.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let itemCategoriesArrayValue = json["itemCategories"].array {
        self.itemCategories = []
        for item in itemCategoriesArrayValue {
            if let value = WsListItemCategories.ItemCategory(json: item), var itemCategories = itemCategories {
                itemCategories.append(value)
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
    case FAILED
}

}
