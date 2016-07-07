import Foundation
import SwiftyJSON

struct WsListFacilities {

    class Request: WsRequest {
        typealias Response = WsListFacilities.Response
        
        var orgTypes: [OrgType]?
        var facilityTypes: [FacilityType]?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/facility/list"
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
            
            if let orgTypesArrayValue = json["orgTypes"].array {
                self.orgTypes = []
                for item in orgTypesArrayValue {
                    if let value = OrgType(rawValue: item.stringValue), var orgTypes = orgTypes {
                        orgTypes.append(value)
                    }
                }
            }
            
            if let facilityTypesArrayValue = json["facilityTypes"].array {
                self.facilityTypes = []
                for item in facilityTypesArrayValue {
                    if let value = FacilityType(rawValue: item.stringValue), var facilityTypes = facilityTypes {
                        facilityTypes.append(value)
                    }
                }
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListFacilities.Code?
    var facilityEntities: [FacilityEntity]?

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
        if let code = WsListFacilities.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let facilityEntitiesArrayValue = json["facilityEntities"].array {
        self.facilityEntities = []
        for item in facilityEntitiesArrayValue {
            if let value = FacilityEntity(json: item), var facilityEntities = facilityEntities {
                facilityEntities.append(value)
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

}
