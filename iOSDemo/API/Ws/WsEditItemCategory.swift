import Foundation
import SwiftyJSON

struct WsEditItemCategory {

    class Request: WsRequest {
        typealias Response = WsEditItemCategory.Response
        
        var id: String?
        var name: String?
        var code: String?
        var delete: Bool?
        
        class func getPath() -> String {
            return "/catalogs/edititemcategory"
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
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let code = json["code"].string {
                self.code = code
            }
            
            if let delete = json["delete"].bool {
                self.delete = delete
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
            
            if let code = self.code {
                dictionary["code"] = code
            }
            
            if let delete = self.delete {
                dictionary["delete"] = delete
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CATEGORY_ID_REQUIRED
    case NAME_REQUIRED
    case CODE_REQUIRED
    case NOT_FOUND
    case PARENT_NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsEditItemCategory.Code?

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
        if let code = WsEditItemCategory.Code(rawValue: codeStringValue) {
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

}
