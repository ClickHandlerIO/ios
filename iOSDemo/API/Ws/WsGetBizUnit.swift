import Foundation
import SwiftyJSON

struct WsGetBizUnit {

    class Request: WsRequest {
        typealias Response = WsGetBizUnit.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/bizunit/get"
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

class Response: JSONSerializable {
    var code: WsGetBizUnit.Code?
    var detail: WsGetBizUnit.BizUnitDetail?

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
        if let code = WsGetBizUnit.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetBizUnit.BizUnitDetail(json: json["detail"])
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

class BizUnitDetail: JSONSerializable {
    var id: String?
    var orgType: OrgType?
    var orgId: String?
    var orgName: String?
    var name: String?
    var description: String?
    var active: Bool?

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
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let orgName = json["orgName"].string {
        self.orgName = orgName
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let description = json["description"].string {
        self.description = description
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
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let orgName = self.orgName {
        dictionary["orgName"] = orgName
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let description = self.description {
        dictionary["description"] = description
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case FAILED
    case GET_BIZ_UNIT_FAILED
    case NOT_FOUND
    case INVALID_ID
}

}
