import Foundation
import SwiftyJSON

struct WsGetProcedure {

    class Request: WsRequest {
        typealias Response = WsGetProcedure.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/procedure/get"
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
    var code: WsGetProcedure.Code?
    var detail: WsGetProcedure.ProcedureDetail?

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
        if let code = WsGetProcedure.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetProcedure.ProcedureDetail(json: json["detail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let detail = self.detail {
        dictionary["detail"] = detail.asDictionary()
    }
    
    return dictionary
}
}

class ProcedureDetail: JSONSerializable {
    var id: String?
    var name: String?
    var orgId: String?
    var orgName: String?
    var icdCode: String?
    var bodySideRequired: Bool?
    var active: Bool?
    var description: String?

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
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let orgName = json["orgName"].string {
        self.orgName = orgName
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
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let orgName = self.orgName {
        dictionary["orgName"] = orgName
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

}
