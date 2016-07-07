import Foundation
import SwiftyJSON

struct WsConfigureItem {

    class Request: WsRequest {
        typealias Response = WsConfigureItem.Response
        
        var itemVersionId: String?
        var roamingComponents: [WsConfigureItem.Component]?
        var kitContainers: [WsConfigureItem.KitContainer]?
        var trayLayers: [WsConfigureItem.TrayLayer]?
        
        class func getPath() -> String {
            return "/inventory/item/configureitem"
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
            
            if let roamingComponentsArrayValue = json["roamingComponents"].array {
                self.roamingComponents = []
                for item in roamingComponentsArrayValue {
                    if let value = WsConfigureItem.Component(json: item), var roamingComponents = roamingComponents {
                        roamingComponents.append(value)
                    }
                }
            }
            
            if let kitContainersArrayValue = json["kitContainers"].array {
                self.kitContainers = []
                for item in kitContainersArrayValue {
                    if let value = WsConfigureItem.KitContainer(json: item), var kitContainers = kitContainers {
                        kitContainers.append(value)
                    }
                }
            }
            
            if let trayLayersArrayValue = json["trayLayers"].array {
                self.trayLayers = []
                for item in trayLayersArrayValue {
                    if let value = WsConfigureItem.TrayLayer(json: item), var trayLayers = trayLayers {
                        trayLayers.append(value)
                    }
                }
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

enum Action: String {
    case ADD
    case REMOVE
    case UPDATE
}

class ComponentVersion: JSONSerializable {
    var action: WsConfigureItem.Action?
    var id: String?
    var itemVersionId: String?

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
    
    if let actionStringValue = json["action"].string {
        if let action = WsConfigureItem.Action(rawValue: actionStringValue) {
            self.action = action
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let action = self.action {
        dictionary["action"] = action.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    return dictionary
}
}

class KitContainer: JSONSerializable {
    var action: WsConfigureItem.Action?
    var id: String?
    var containerNumber: Int?
    var containerType: ComponentContainerType?
    var components: [WsConfigureItem.Component]?

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
    
    if let actionStringValue = json["action"].string {
        if let action = WsConfigureItem.Action(rawValue: actionStringValue) {
            self.action = action
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let containerNumber = json["containerNumber"].int {
        self.containerNumber = containerNumber
    }
    
    if let containerTypeStringValue = json["containerType"].string {
        if let containerType = ComponentContainerType(rawValue: containerTypeStringValue) {
            self.containerType = containerType
        }
    }
    
    if let componentsArrayValue = json["components"].array {
        self.components = []
        for item in componentsArrayValue {
            if let value = WsConfigureItem.Component(json: item), var components = components {
                components.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let action = self.action {
        dictionary["action"] = action.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let containerNumber = self.containerNumber {
        dictionary["containerNumber"] = containerNumber
    }
    
    if let containerType = self.containerType {
        dictionary["containerType"] = containerType.rawValue
    }
    
    return dictionary
}
}

class Component: JSONSerializable {
    var action: WsConfigureItem.Action?
    var id: String?
    var componentItemId: String?
    var anyVersion: Bool?
    var quantity: Int?
    var componentVersions: [WsConfigureItem.ComponentVersion]?

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
    
    if let actionStringValue = json["action"].string {
        if let action = WsConfigureItem.Action(rawValue: actionStringValue) {
            self.action = action
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let componentItemId = json["componentItemId"].string {
        self.componentItemId = componentItemId
    }
    
    if let anyVersion = json["anyVersion"].bool {
        self.anyVersion = anyVersion
    }
    
    if let quantity = json["quantity"].int {
        self.quantity = quantity
    }
    
    if let componentVersionsArrayValue = json["componentVersions"].array {
        self.componentVersions = []
        for item in componentVersionsArrayValue {
            if let value = WsConfigureItem.ComponentVersion(json: item), var componentVersions = componentVersions {
                componentVersions.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let action = self.action {
        dictionary["action"] = action.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let componentItemId = self.componentItemId {
        dictionary["componentItemId"] = componentItemId
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

class Response: JSONSerializable {
    var code: WsConfigureItem.Code?

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
        if let code = WsConfigureItem.Code(rawValue: codeStringValue) {
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
    case ITEM_VERSION_REQUIRED
    case INVALID_REQUEST
    case IMPROPER_ROOT_ITEM_TYPE
    case FAILED
}

class TrayLayer: JSONSerializable {
    var action: WsConfigureItem.Action?
    var id: String?
    var layerNumber: Int?
    var components: [WsConfigureItem.Component]?

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
    
    if let actionStringValue = json["action"].string {
        if let action = WsConfigureItem.Action(rawValue: actionStringValue) {
            self.action = action
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let layerNumber = json["layerNumber"].int {
        self.layerNumber = layerNumber
    }
    
    if let componentsArrayValue = json["components"].array {
        self.components = []
        for item in componentsArrayValue {
            if let value = WsConfigureItem.Component(json: item), var components = components {
                components.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let action = self.action {
        dictionary["action"] = action.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let layerNumber = self.layerNumber {
        dictionary["layerNumber"] = layerNumber
    }
    
    return dictionary
}
}

}
