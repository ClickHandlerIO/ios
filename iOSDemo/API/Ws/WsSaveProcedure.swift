import Foundation
import SwiftyJSON

struct WsSaveProcedure {

    class Request: WsRequest {
        typealias Response = WsSaveProcedure.Response
        
        var id: String?
        var orgId: String?
        var name: String?
        var icdCode: String?
        var bodySideRequired: Bool?
        var active: Bool?
        var description: String?
        
        class func getPath() -> String {
            return "/dir/procedure/save"
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
            
            if let orgId = json["orgId"].string {
                self.orgId = orgId
            }
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let icdCode = json["icdCode"].string {
                self.icdCode = icdCode
            }
            
            if let bodySideRequired = json["bodySideRequired"].bool {
                self.bodySideRequired = bodySideRequired
            }
            
            if let active = json["active"].bool {
                self.active = active
            }
            
            if let description = json["description"].string {
                self.description = description
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let orgId = self.orgId {
                dictionary["orgId"] = orgId
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let icdCode = self.icdCode {
                dictionary["icdCode"] = icdCode
            }
            
            if let bodySideRequired = self.bodySideRequired {
                dictionary["bodySideRequired"] = bodySideRequired
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsSaveProcedure.Code?
    var id: String?

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
        if let code = WsSaveProcedure.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case NAME_REQUIRED
    case ICD_CODE_REQUIRED
    case INVALID_ORG_ID
    case NOT_FOUND
    case FAILED
}

}
