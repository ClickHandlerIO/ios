import Foundation
import SwiftyJSON

struct WsSavePhysician {

    class Request: WsRequest {
        typealias Response = WsSavePhysician.Response
        
        var id: String?
        var physicianType: PhysicianType?
        var name: PersonName?
        var active: Bool?
        
        class func getPath() -> String {
            return "/dir/physician/save"
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
            
            if let physicianTypeStringValue = json["physicianType"].string {
                if let physicianType = PhysicianType(rawValue: physicianTypeStringValue) {
                    self.physicianType = physicianType
                }
            }
            
            self.name = PersonName(json: json["name"])
            
            if let active = json["active"].bool {
                self.active = active
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let physicianType = self.physicianType {
                dictionary["physicianType"] = physicianType.rawValue
            }
            
            if let name = self.name {
                dictionary["name"] = name.asDictionary()
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NAME_REQUIRED
    case CREATE_FAILED
    case GET_FAILED
    case NOT_FOUND
    case UPDATE_FAILED
    case PHYS_TYPE_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSavePhysician.Code?
    var physicianId: String?

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
        if let code = WsSavePhysician.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let physicianId = json["physicianId"].string {
        self.physicianId = physicianId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let physicianId = self.physicianId {
        dictionary["physicianId"] = physicianId
    }
    
    return dictionary
}
}

}
