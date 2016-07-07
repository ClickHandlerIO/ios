import Foundation
import SwiftyJSON

struct WsEditCaseEventScheduling {

    class Request: WsRequest {
        typealias Response = WsEditCaseEventScheduling.Response
        
        var caseEventId: String?
        var salesOuId: String?
        var procedureId: String?
        var facilityId: String?
        var physicianId: String?
        var hcrIdTeamId: String?
        var coverageId: String?
        var bodySide: BodySide?
        var description: String?
        
        class func getPath() -> String {
            return "/event/detail/surgery/editcaseeventscheduling"
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
            
            if let caseEventId = json["caseEventId"].string {
                self.caseEventId = caseEventId
            }
            
            if let salesOuId = json["salesOuId"].string {
                self.salesOuId = salesOuId
            }
            
            if let procedureId = json["procedureId"].string {
                self.procedureId = procedureId
            }
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
            }
            
            if let physicianId = json["physicianId"].string {
                self.physicianId = physicianId
            }
            
            if let hcrIdTeamId = json["hcrIdTeamId"].string {
                self.hcrIdTeamId = hcrIdTeamId
            }
            
            if let coverageId = json["coverageId"].string {
                self.coverageId = coverageId
            }
            
            if let bodySideStringValue = json["bodySide"].string {
                if let bodySide = BodySide(rawValue: bodySideStringValue) {
                    self.bodySide = bodySide
                }
            }
            
            if let description = json["description"].string {
                self.description = description
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
            }
            
            if let salesOuId = self.salesOuId {
                dictionary["salesOuId"] = salesOuId
            }
            
            if let procedureId = self.procedureId {
                dictionary["procedureId"] = procedureId
            }
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
            }
            
            if let physicianId = self.physicianId {
                dictionary["physicianId"] = physicianId
            }
            
            if let hcrIdTeamId = self.hcrIdTeamId {
                dictionary["hcrIdTeamId"] = hcrIdTeamId
            }
            
            if let coverageId = self.coverageId {
                dictionary["coverageId"] = coverageId
            }
            
            if let bodySide = self.bodySide {
                dictionary["bodySide"] = bodySide.rawValue
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case NOT_FOUND
    case PROCEDURE_ID_REQUIRED
    case FACILITY_ID_REQUIRED
    case PHYSICIAN_ID_REQUIRED
    case HCR_TEAM_ID_REQUIRED
    case COVERAGE_ID_REQUIRED
    case SALES_OU_ID_REQUIRED
    case CASE_EVENT_BUSY
    case EVENT_NOT_FOUND
    case EVENT_BUSY
    case LOAN_BUSY
    case ORDER_BUSY
    case PICK_BUSY
    case STOCK_BUSY
    case SHIPMENT_BUSY
    case BODY_SIDE_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsEditCaseEventScheduling.Code?

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
        if let code = WsEditCaseEventScheduling.Code(rawValue: codeStringValue) {
            self.code = code
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
