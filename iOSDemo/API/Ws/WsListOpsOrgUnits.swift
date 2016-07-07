import Foundation
import SwiftyJSON

struct WsListOpsOrgUnits {

    class Request: WsRequest {
        typealias Response = WsListOpsOrgUnits.Response
        
        var search: String?
        var locationType: LocationType?
        var locationId: String?
        var bizUnitId: String?
        
        class func getPath() -> String {
            return "/dir/orgunit/listopsorgunits"
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
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let locationTypeStringValue = json["locationType"].string {
                if let locationType = LocationType(rawValue: locationTypeStringValue) {
                    self.locationType = locationType
                }
            }
            
            if let locationId = json["locationId"].string {
                self.locationId = locationId
            }
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let locationType = self.locationType {
                dictionary["locationType"] = locationType.rawValue
            }
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListOpsOrgUnits.Code?
    var entities: [OrgUnitEntity]?

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
        if let code = WsListOpsOrgUnits.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let entitiesArrayValue = json["entities"].array {
        self.entities = []
        for item in entitiesArrayValue {
            if let value = OrgUnitEntity(json: item), var entities = entities {
                entities.append(value)
            }
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
    case FAILED
    case INVALID_ORG_ID
}

}
