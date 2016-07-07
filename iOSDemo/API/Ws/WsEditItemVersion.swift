import Foundation
import SwiftyJSON

struct WsEditItemVersion {

    class Request: WsRequest {
        typealias Response = WsEditItemVersion.Response
        
        var id: String?
        var version: String?
        var active: Bool?
        var startManufactureDate: Int?
        var endManufactureDate: Int?
        
        class func getPath() -> String {
            return "/inventory/version/edititemversion"
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
            
            if let version = json["version"].string {
                self.version = version
            }
            
            if let active = json["active"].bool {
                self.active = active
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let version = self.version {
                dictionary["version"] = version
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsEditItemVersion.Code?

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
        if let code = WsEditItemVersion.Code(rawValue: codeStringValue) {
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
    case ID_REQUIRED
    case VERSION_REQUIRED
    case DUPLICATE_VERSION
    case NOT_FOUND
    case FAILED
}

}
