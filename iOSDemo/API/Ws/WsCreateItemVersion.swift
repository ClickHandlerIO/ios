import Foundation
import SwiftyJSON

struct WsCreateItemVersion {

    class Request: WsRequest {
        typealias Response = WsCreateItemVersion.Response
        
        var itemId: String?
        var version: String?
        var startManufactureDate: Int?
        var endManufactureDate: Int?
        var cloneComponentsFromItemVersionId: String?
        
        class func getPath() -> String {
            return "/inventory/version/createitemversion"
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
            
            if let version = json["version"].string {
                self.version = version
            }
            
            if let cloneComponentsFromItemVersionId = json["cloneComponentsFromItemVersionId"].string {
                self.cloneComponentsFromItemVersionId = cloneComponentsFromItemVersionId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            if let version = self.version {
                dictionary["version"] = version
            }
            
            if let cloneComponentsFromItemVersionId = self.cloneComponentsFromItemVersionId {
                dictionary["cloneComponentsFromItemVersionId"] = cloneComponentsFromItemVersionId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateItemVersion.Code?
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
    
    if let codeStringValue = json["code"].string {
        if let code = WsCreateItemVersion.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case VERSION_REQUIRED
    case START_MANU_DATE_REQUIRED
    case END_MANU_DATE_REQUIRED
    case ALREADY_EXISTS
    case EXISTING_COMPONENTS_NOT_FOUND
    case FAILED
}

}
