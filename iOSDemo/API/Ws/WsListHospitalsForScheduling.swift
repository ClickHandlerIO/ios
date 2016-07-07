import Foundation
import SwiftyJSON

struct WsListHospitalsForScheduling {

    class Request: WsRequest {
        typealias Response = WsListHospitalsForScheduling.Response
        
        var search: String?
        var bizUnitId: String?
        var procedureId: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/listhospitalsforscheduling"
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
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
            
            if let procedureId = json["procedureId"].string {
                self.procedureId = procedureId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let procedureId = self.procedureId {
                dictionary["procedureId"] = procedureId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListHospitalsForScheduling.Code?
    var hospitals: [FacilityEntity]?

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
        if let code = WsListHospitalsForScheduling.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let hospitalsArrayValue = json["hospitals"].array {
        self.hospitals = []
        for item in hospitalsArrayValue {
            if let value = FacilityEntity(json: item), var hospitals = hospitals {
                hospitals.append(value)
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
    case NOT_IMPLEMENTED
    case BIZ_UNIT_ID_REQUIRED
    case PROCEDURE_ID_REQUIRED
    case FAILED
}

}
