import Foundation
import SwiftyJSON

struct WsListPhysicianLinkedFacilities {

    class Request: WsRequest {
        typealias Response = WsListPhysicianLinkedFacilities.Response
        
        var physicianId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/physiciantofacility/listfaciliteslinked"
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
            
            if let physicianId = json["physicianId"].string {
                self.physicianId = physicianId
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
            
            if let physicianId = self.physicianId {
                dictionary["physicianId"] = physicianId
            }
            
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

class Response: JSONSerializable {
    var code: WsListPhysicianLinkedFacilities.Code?
    var facilityRelations: [FacilityRelation]?

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
        if let code = WsListPhysicianLinkedFacilities.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let facilityRelationsArrayValue = json["facilityRelations"].array {
        self.facilityRelations = []
        for item in facilityRelationsArrayValue {
            if let value = FacilityRelation(json: item), var facilityRelations = facilityRelations {
                facilityRelations.append(value)
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
    case PHYSICIAN_ID_REQUIRED
    case FAILED
}

}
