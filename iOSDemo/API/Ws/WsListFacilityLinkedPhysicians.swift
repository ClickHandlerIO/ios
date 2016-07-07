import Foundation
import SwiftyJSON

struct WsListFacilityLinkedPhysicians {

    class Request: WsRequest {
        typealias Response = WsListFacilityLinkedPhysicians.Response
        
        var facilityId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/physiciantofacility/listphysicianslinked"
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
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
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
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
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

enum Code: String {
    case SUCCESS
    case FACILITY_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListFacilityLinkedPhysicians.Code?
    var physicianRelations: [WsListFacilityLinkedPhysicians.PhysicianRelation]?

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
        if let code = WsListFacilityLinkedPhysicians.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let physicianRelationsArrayValue = json["physicianRelations"].array {
        self.physicianRelations = []
        for item in physicianRelationsArrayValue {
            if let value = WsListFacilityLinkedPhysicians.PhysicianRelation(json: item), var physicianRelations = physicianRelations {
                physicianRelations.append(value)
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

class PhysicianRelation: JSONSerializable {
    var id: String?
    var physicianId: String?
    var physicianType: PhysicianType?
    var physicianName: PersonName?
    var physicianActive: Bool?

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
    
    if let physicianId = json["physicianId"].string {
        self.physicianId = physicianId
    }
    
    if let physicianTypeStringValue = json["physicianType"].string {
        if let physicianType = PhysicianType(rawValue: physicianTypeStringValue) {
            self.physicianType = physicianType
        }
    }
    
    self.physicianName = PersonName(json: json["physicianName"])
    
    if let physicianActive = json["physicianActive"].bool {
        self.physicianActive = physicianActive
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let physicianId = self.physicianId {
        dictionary["physicianId"] = physicianId
    }
    
    if let physicianType = self.physicianType {
        dictionary["physicianType"] = physicianType.rawValue
    }
    
    if let physicianName = self.physicianName {
        dictionary["physicianName"] = physicianName.asDictionary()
    }
    
    if let physicianActive = self.physicianActive {
        dictionary["physicianActive"] = physicianActive
    }
    
    return dictionary
}
}

}
