import Foundation
import SwiftyJSON

struct WsListItemAndVersion {

    class Request: WsRequest {
        typealias Response = WsListItemAndVersion.Response
        
        
        class func getPath() -> String {
            return "/inventory/item/listitemandversion"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListItemAndVersion.Code?
    var itemAndVersionList: [WsListItemAndVersion.ItemAndVersion]?

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
        if let code = WsListItemAndVersion.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let itemAndVersionListArrayValue = json["itemAndVersionList"].array {
        self.itemAndVersionList = []
        for item in itemAndVersionListArrayValue {
            if let value = WsListItemAndVersion.ItemAndVersion(json: item), var itemAndVersionList = itemAndVersionList {
                itemAndVersionList.append(value)
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
    case NOT_IMPLEMENTED
    case CONTEXT_REQUIRED
    case FAILED
}

class ItemAndVersion: JSONSerializable {
    var itemId: String?
    var itemNumber: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var longDesc: String?
    var shortDesc: String?
    var itemVersionId: String?
    var itemVersion: String?

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
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let longDesc = json["longDesc"].string {
        self.longDesc = longDesc
    }
    
    if let shortDesc = json["shortDesc"].string {
        self.shortDesc = shortDesc
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let itemVersion = json["itemVersion"].string {
        self.itemVersion = itemVersion
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let longDesc = self.longDesc {
        dictionary["longDesc"] = longDesc
    }
    
    if let shortDesc = self.shortDesc {
        dictionary["shortDesc"] = shortDesc
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let itemVersion = self.itemVersion {
        dictionary["itemVersion"] = itemVersion
    }
    
    return dictionary
}
}

}
