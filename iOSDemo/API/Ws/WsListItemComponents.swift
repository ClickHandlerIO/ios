import Foundation
import SwiftyJSON

struct WsListItemComponents {

    class Request: WsRequest {
        typealias Response = WsListItemComponents.Response
        
        var itemVersionId: String?
        
        class func getPath() -> String {
            return "/inventory/item/listitemcomponents"
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
            
            if let itemVersionId = json["itemVersionId"].string {
                self.itemVersionId = itemVersionId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemVersionId = self.itemVersionId {
                dictionary["itemVersionId"] = itemVersionId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListItemComponents.Code?
    var item: ItemEntity?
    var itemVersion: ItemVersionEntity?
    var containers: [WsListItemComponents.ItemContainer]?

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
        if let code = WsListItemComponents.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.item = ItemEntity(json: json["item"])
    
    self.itemVersion = ItemVersionEntity(json: json["itemVersion"])
    
    if let containersArrayValue = json["containers"].array {
        self.containers = []
        for item in containersArrayValue {
            if let value = WsListItemComponents.ItemContainer(json: item), var containers = containers {
                containers.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let item = self.item {
        dictionary["item"] = item.asDictionary()
    }
    
    if let itemVersion = self.itemVersion {
        dictionary["itemVersion"] = itemVersion.asDictionary()
    }
    
    return dictionary
}
}

class ItemContainer: JSONSerializable {
    var containerType: WsListItemComponents.ContainerType?
    var id: String?
    var number: Int?
    var components: [WsListItemComponents.Component]?

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
    
    if let containerTypeStringValue = json["containerType"].string {
        if let containerType = WsListItemComponents.ContainerType(rawValue: containerTypeStringValue) {
            self.containerType = containerType
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let number = json["number"].int {
        self.number = number
    }
    
    if let componentsArrayValue = json["components"].array {
        self.components = []
        for item in componentsArrayValue {
            if let value = WsListItemComponents.Component(json: item), var components = components {
                components.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let containerType = self.containerType {
        dictionary["containerType"] = containerType.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let number = self.number {
        dictionary["number"] = number
    }
    
    return dictionary
}
}

enum ContainerType: String {
    case ROAMING
    case KIT_CONTAINER
    case TRAY_LAYER
}

enum Code: String {
    case SUCCESS
    case ITEM_VERSION_ID_REQUIRED
    case ITEM_NOT_FOUND
    case FAILED
}

class Component: JSONSerializable {
    var id: String?
    var itemId: String?
    var itemNumber: String?
    var itemClass: ItemClass?
    var itemType: ItemType?
    var shortDesc: String?
    var longDesc: String?
    var anyVersion: Bool?
    var versions: [ItemVersionEntity]?
    var quantity: Int?

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
    
    if let shortDesc = json["shortDesc"].string {
        self.shortDesc = shortDesc
    }
    
    if let longDesc = json["longDesc"].string {
        self.longDesc = longDesc
    }
    
    if let anyVersion = json["anyVersion"].bool {
        self.anyVersion = anyVersion
    }
    
    if let versionsArrayValue = json["versions"].array {
        self.versions = []
        for item in versionsArrayValue {
            if let value = ItemVersionEntity(json: item), var versions = versions {
                versions.append(value)
            }
        }
    }
    
    if let quantity = json["quantity"].int {
        self.quantity = quantity
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
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
    
    if let shortDesc = self.shortDesc {
        dictionary["shortDesc"] = shortDesc
    }
    
    if let longDesc = self.longDesc {
        dictionary["longDesc"] = longDesc
    }
    
    if let anyVersion = self.anyVersion {
        dictionary["anyVersion"] = anyVersion
    }
    
    if let quantity = self.quantity {
        dictionary["quantity"] = quantity
    }
    
    return dictionary
}
}

}
