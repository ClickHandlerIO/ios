import Foundation
import SwiftyJSON

struct WsGetConsumer {

    class Request: WsRequest {
        typealias Response = WsGetConsumer.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/consumer/get"
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

class ConsumerDetail: JSONSerializable {
    var id: String?
    var orgId: String?
    var orgType: OrgType?
    var orgName: String?
    var name: PersonName?
    var active: Bool?
    var userId: String?
    var userStatus: UserStatus?
    var timeZone: TZ?

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
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let orgName = json["orgName"].string {
        self.orgName = orgName
    }
    
    self.name = PersonName(json: json["name"])
    
    if let active = json["active"].bool {
        self.active = active
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    if let userStatusStringValue = json["userStatus"].string {
        if let userStatus = UserStatus(rawValue: userStatusStringValue) {
            self.userStatus = userStatus
        }
    }
    
    if let timeZoneStringValue = json["timeZone"].string {
        if let timeZone = TZ(rawValue: timeZoneStringValue) {
            self.timeZone = timeZone
        }
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
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let orgName = self.orgName {
        dictionary["orgName"] = orgName
    }
    
    if let name = self.name {
        dictionary["name"] = name.asDictionary()
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let userStatus = self.userStatus {
        dictionary["userStatus"] = userStatus.rawValue
    }
    
    if let timeZone = self.timeZone {
        dictionary["timeZone"] = timeZone.rawValue
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsGetConsumer.Code?
    var detail: WsGetConsumer.ConsumerDetail?

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
        if let code = WsGetConsumer.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetConsumer.ConsumerDetail(json: json["detail"])
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

}
