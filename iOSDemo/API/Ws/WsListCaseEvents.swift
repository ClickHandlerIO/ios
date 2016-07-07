import Foundation
import SwiftyJSON

struct WsListCaseEvents {

    class Request: WsRequest {
        typealias Response = WsListCaseEvents.Response
        
        var startDate: Int?
        var endDate: Int?
        var hcrIds: [String]?
        var coverageHcrIds: [String]?
        var teamIds: [String]?
        var facilityIds: [String]?
        var surgeonIds: [String]?
        var procedureIds: [String]?
        var bodySides: [BodySide]?
        var statuses: [CaseEventStatus]?
        var patientName: String?
        var sortBy: WsListCaseEvents.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/event/search/case/listcaseevents"
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
            
            if let hcrIdsArrayValue = json["hcrIds"].array {
                self.hcrIds = []
                for item in hcrIdsArrayValue {
                    if var hcrIds = hcrIds, let itemValue = item.string {
                        hcrIds.append(itemValue)
                    }
                }
            }
            
            if let coverageHcrIdsArrayValue = json["coverageHcrIds"].array {
                self.coverageHcrIds = []
                for item in coverageHcrIdsArrayValue {
                    if var coverageHcrIds = coverageHcrIds, let itemValue = item.string {
                        coverageHcrIds.append(itemValue)
                    }
                }
            }
            
            if let teamIdsArrayValue = json["teamIds"].array {
                self.teamIds = []
                for item in teamIdsArrayValue {
                    if var teamIds = teamIds, let itemValue = item.string {
                        teamIds.append(itemValue)
                    }
                }
            }
            
            if let facilityIdsArrayValue = json["facilityIds"].array {
                self.facilityIds = []
                for item in facilityIdsArrayValue {
                    if var facilityIds = facilityIds, let itemValue = item.string {
                        facilityIds.append(itemValue)
                    }
                }
            }
            
            if let surgeonIdsArrayValue = json["surgeonIds"].array {
                self.surgeonIds = []
                for item in surgeonIdsArrayValue {
                    if var surgeonIds = surgeonIds, let itemValue = item.string {
                        surgeonIds.append(itemValue)
                    }
                }
            }
            
            if let procedureIdsArrayValue = json["procedureIds"].array {
                self.procedureIds = []
                for item in procedureIdsArrayValue {
                    if var procedureIds = procedureIds, let itemValue = item.string {
                        procedureIds.append(itemValue)
                    }
                }
            }
            
            if let bodySidesArrayValue = json["bodySides"].array {
                self.bodySides = []
                for item in bodySidesArrayValue {
                    if let value = BodySide(rawValue: item.stringValue), var bodySides = bodySides {
                        bodySides.append(value)
                    }
                }
            }
            
            if let statusesArrayValue = json["statuses"].array {
                self.statuses = []
                for item in statusesArrayValue {
                    if let value = CaseEventStatus(rawValue: item.stringValue), var statuses = statuses {
                        statuses.append(value)
                    }
                }
            }
            
            if let patientName = json["patientName"].string {
                self.patientName = patientName
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListCaseEvents.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let patientName = self.patientName {
                dictionary["patientName"] = patientName
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            return dictionary
        }
    }

enum SortBy: String {
    case CASE_NUMBER
    case STATUS
    case DATE
    case SURGEON
    case HOSPITAL
    case PATIENT
}

enum Code: String {
    case SUCCESS
    case START_DATE_REQUIRED
    case END_DATE_REQUIRED
    case FAILED
}

class CaseEvent: JSONSerializable {
    var caseEventId: String?
    var caseNumber: Int?
    var eventDate: Int?
    var status: CaseEventStatus?
    var patientName: String?
    var patientMrn: String?
    var facilityName: String?
    var surgeonName: String?
    var repTeamName: String?
    var procedureName: String?

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
    
    if let caseNumber = json["caseNumber"].int {
        self.caseNumber = caseNumber
    }
    
    if let statusStringValue = json["status"].string {
        if let status = CaseEventStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
    
    if let patientName = json["patientName"].string {
        self.patientName = patientName
    }
    
    if let patientMrn = json["patientMrn"].string {
        self.patientMrn = patientMrn
    }
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let surgeonName = json["surgeonName"].string {
        self.surgeonName = surgeonName
    }
    
    if let repTeamName = json["repTeamName"].string {
        self.repTeamName = repTeamName
    }
    
    if let procedureName = json["procedureName"].string {
        self.procedureName = procedureName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let caseEventId = self.caseEventId {
        dictionary["caseEventId"] = caseEventId
    }
    
    if let caseNumber = self.caseNumber {
        dictionary["caseNumber"] = caseNumber
    }
    
    if let status = self.status {
        dictionary["status"] = status.rawValue
    }
    
    if let patientName = self.patientName {
        dictionary["patientName"] = patientName
    }
    
    if let patientMrn = self.patientMrn {
        dictionary["patientMrn"] = patientMrn
    }
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let surgeonName = self.surgeonName {
        dictionary["surgeonName"] = surgeonName
    }
    
    if let repTeamName = self.repTeamName {
        dictionary["repTeamName"] = repTeamName
    }
    
    if let procedureName = self.procedureName {
        dictionary["procedureName"] = procedureName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListCaseEvents.Code?
    var caseEvents: [WsListCaseEvents.CaseEvent]?

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
        if let code = WsListCaseEvents.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let caseEventsArrayValue = json["caseEvents"].array {
        self.caseEvents = []
        for item in caseEventsArrayValue {
            if let value = WsListCaseEvents.CaseEvent(json: item), var caseEvents = caseEvents {
                caseEvents.append(value)
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
