import Foundation
import SwiftyJSON

struct WsListSurgeonPhysiciansForScheduling {

    class Request: WsRequest {
        typealias Response = WsListSurgeonPhysiciansForScheduling.Response
        
        var bizUnitId: String?
        var facilityId: String?
        var procedureId: String?
        var search: String?
        
        class func getPath() -> String {
            return "/event/scheduling/listsurgeonphysiciansforscheduling"
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
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
            }
            
            if let procedureId = json["procedureId"].string {
                self.procedureId = procedureId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
            }
            
            if let procedureId = self.procedureId {
                dictionary["procedureId"] = procedureId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case BIZ_UNIT_ID_REQUIRED
    case FACILITY_ID_REQUIRED
    case PROCEDURE_ID_REQUIRED
    case NO_RESULTS
    case NOT_IMPLEMENTED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListSurgeonPhysiciansForScheduling.Code?
    var surgeons: [PhysicianEntity]?

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
        if let code = WsListSurgeonPhysiciansForScheduling.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let surgeonsArrayValue = json["surgeons"].array {
        self.surgeons = []
        for item in surgeonsArrayValue {
            if let value = PhysicianEntity(json: item), var surgeons = surgeons {
                surgeons.append(value)
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
