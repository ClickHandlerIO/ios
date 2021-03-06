import Foundation
import SwiftyJSON

struct WsListCoverageForScheduling {

    class Request: WsRequest {
        typealias Response = WsListCoverageForScheduling.Response
        
        var bizUnitId: String?
        var facilityId: String?
        var procedureId: String?
        var physicianId: String?
        var search: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/listcoverageforscheduling"
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
            
            if let physicianId = json["physicianId"].string {
                self.physicianId = physicianId
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
            
            if let physicianId = self.physicianId {
                dictionary["physicianId"] = physicianId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListCoverageForScheduling.Code?
    var hcrs: [HcrTeam]?

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
        if let code = WsListCoverageForScheduling.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let hcrsArrayValue = json["hcrs"].array {
        self.hcrs = []
        for item in hcrsArrayValue {
            if let value = HcrTeam(json: item), var hcrs = hcrs {
                hcrs.append(value)
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
    case BIZ_UNIT_ID_REQUIRED
    case FACILITY_ID_REQUIRED
    case PROCEDURE_ID_REQUIRED
    case NOT_IMPLEMENTED
    case PHYSICIAN_ID_REQUIRED
    case FAILED
}

}
