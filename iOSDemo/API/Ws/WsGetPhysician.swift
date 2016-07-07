import Foundation
import SwiftyJSON

struct WsGetPhysician {

    class Request: WsRequest {
        typealias Response = WsGetPhysician.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/physician/get"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsGetPhysician.Code?
    var entity: PhysicianEntity?

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
        if let code = WsGetPhysician.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.entity = PhysicianEntity(json: json["entity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let entity = self.entity {
        dictionary["entity"] = entity.asDictionary()
    }
    
    return dictionary
}
}

}
