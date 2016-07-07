import Foundation
import SwiftyJSON

struct WsCreateCaseEvent {

    class Request: WsRequest {
        typealias Response = WsCreateCaseEvent.Response
        
        var surgeryDate: Int?
        var bizUnitId: String?
        var salesOuId: String?
        var facilityId: String?
        var procedureId: String?
        var surgeonPhysicianId: String?
        var hcrIdTeamId: String?
        var coverageId: String?
        var bodySide: BodySide?
        var patientName: PersonName?
        var patientMrn: String?
        var patientDob: Int?
        var patientGender: Gender?
        var fastForward: CaseEventStatus?
        var opsFastForward: CaseEventOpsStatus?
        var salesFastForward: CaseEventSalesStatus?
        var description: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/createcaseevent"
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
            
            if let salesOuId = json["salesOuId"].string {
                self.salesOuId = salesOuId
            }
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
            }
            
            if let procedureId = json["procedureId"].string {
                self.procedureId = procedureId
            }
            
            if let surgeonPhysicianId = json["surgeonPhysicianId"].string {
                self.surgeonPhysicianId = surgeonPhysicianId
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
            
            self.patientName = PersonName(json: json["patientName"])
            
            if let patientMrn = json["patientMrn"].string {
                self.patientMrn = patientMrn
            }
            
            if let patientGenderStringValue = json["patientGender"].string {
                if let patientGender = Gender(rawValue: patientGenderStringValue) {
                    self.patientGender = patientGender
                }
            }
            
            if let fastForwardStringValue = json["fastForward"].string {
                if let fastForward = CaseEventStatus(rawValue: fastForwardStringValue) {
                    self.fastForward = fastForward
                }
            }
            
            if let opsFastForwardStringValue = json["opsFastForward"].string {
                if let opsFastForward = CaseEventOpsStatus(rawValue: opsFastForwardStringValue) {
                    self.opsFastForward = opsFastForward
                }
            }
            
            if let salesFastForwardStringValue = json["salesFastForward"].string {
                if let salesFastForward = CaseEventSalesStatus(rawValue: salesFastForwardStringValue) {
                    self.salesFastForward = salesFastForward
                }
            }
            
            if let description = json["description"].string {
                self.description = description
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let salesOuId = self.salesOuId {
                dictionary["salesOuId"] = salesOuId
            }
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
            }
            
            if let procedureId = self.procedureId {
                dictionary["procedureId"] = procedureId
            }
            
            if let surgeonPhysicianId = self.surgeonPhysicianId {
                dictionary["surgeonPhysicianId"] = surgeonPhysicianId
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
            
            if let patientName = self.patientName {
                dictionary["patientName"] = patientName.asDictionary()
            }
            
            if let patientMrn = self.patientMrn {
                dictionary["patientMrn"] = patientMrn
            }
            
            if let patientGender = self.patientGender {
                dictionary["patientGender"] = patientGender.rawValue
            }
            
            if let fastForward = self.fastForward {
                dictionary["fastForward"] = fastForward.rawValue
            }
            
            if let opsFastForward = self.opsFastForward {
                dictionary["opsFastForward"] = opsFastForward.rawValue
            }
            
            if let salesFastForward = self.salesFastForward {
                dictionary["salesFastForward"] = salesFastForward.rawValue
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateCaseEvent.Code?
    var caseEventId: String?

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
        if let code = WsCreateCaseEvent.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let caseEventId = json["caseEventId"].string {
        self.caseEventId = caseEventId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let caseEventId = self.caseEventId {
        dictionary["caseEventId"] = caseEventId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case BIZ_UNIT_ID_REQUIRED
    case FACILITY_ID_REQUIRED
    case PROCEDURE_ID_REQUIRED
    case PHYSICIAN_ID_REQUIRED
    case HCR_OR_TEAM_ID_REQUIRED
    case COVERAGE_ID_REQUIRED
    case PATIENT_NAME_REQUIRED
    case SURGERY_DATE_REQUIRED
    case SALES_ORG_UNIT_ID_REQUIRED
    case BODY_SIDE_REQUIRED
    case PATIENT_DOB_REQUIRED
    case FAILED
}

}
