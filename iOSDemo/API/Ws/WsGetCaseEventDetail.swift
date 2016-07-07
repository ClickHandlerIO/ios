import Foundation
import SwiftyJSON

struct WsGetCaseEventDetail {

    class Request: WsRequest {
        typealias Response = WsGetCaseEventDetail.Response
        
        var id: String?
        var caseNumber: Int?
        
        class func getPath() -> String {
            return "/event/detail/surgery/getcaseeventdetail"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let caseNumber = json["caseNumber"].int {
                self.caseNumber = caseNumber
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let caseNumber = self.caseNumber {
                dictionary["caseNumber"] = caseNumber
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetCaseEventDetail.Code?
    var caseEventDetail: WsGetCaseEventDetail.CaseEventDetail?

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
        if let code = WsGetCaseEventDetail.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.caseEventDetail = WsGetCaseEventDetail.CaseEventDetail(json: json["caseEventDetail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let caseEventDetail = self.caseEventDetail {
        dictionary["caseEventDetail"] = caseEventDetail.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_OR_NUMBER_REQUIRED
    case NOT_FOUND
    case FAILED
}

class LinkedOrder: JSONSerializable {
    var orderId: String?
    var orderNumber: String?
    var reasonName: String?
    var reasonGroup: OrderReasonGroup?

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
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let orderNumber = json["orderNumber"].string {
        self.orderNumber = orderNumber
    }
    
    if let reasonName = json["reasonName"].string {
        self.reasonName = reasonName
    }
    
    if let reasonGroupStringValue = json["reasonGroup"].string {
        if let reasonGroup = OrderReasonGroup(rawValue: reasonGroupStringValue) {
            self.reasonGroup = reasonGroup
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let orderNumber = self.orderNumber {
        dictionary["orderNumber"] = orderNumber
    }
    
    if let reasonName = self.reasonName {
        dictionary["reasonName"] = reasonName
    }
    
    if let reasonGroup = self.reasonGroup {
        dictionary["reasonGroup"] = reasonGroup.rawValue
    }
    
    return dictionary
}
}

class CaseEventDetail: JSONSerializable {
    var event: EventEntity?
    var caseEvent: CaseEventEntity?
    var bizUnit: BizUnit?
    var opsOrgUnit: OrgUnitEntity?
    var salesOrgUnit: OrgUnitEntity?
    var procedure: ProcedureEntity?
    var hospital: FacilityEntity?
    var physician: PhysicianEntity?
    var hcr: HcrTeam?
    var team: HcrTeam?
    var coverage: HcrTeam?
    var patient: PatientEntity?
    var implantLoan: WsGetCaseEventDetail.Loan?
    var instrumentLoan: WsGetCaseEventDetail.Loan?
    var linkedOrders: [WsGetCaseEventDetail.LinkedOrder]?

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
    
    self.event = EventEntity(json: json["event"])
    
    self.caseEvent = CaseEventEntity(json: json["caseEvent"])
    
    self.bizUnit = BizUnit(json: json["bizUnit"])
    
    self.opsOrgUnit = OrgUnitEntity(json: json["opsOrgUnit"])
    
    self.salesOrgUnit = OrgUnitEntity(json: json["salesOrgUnit"])
    
    self.procedure = ProcedureEntity(json: json["procedure"])
    
    self.hospital = FacilityEntity(json: json["hospital"])
    
    self.physician = PhysicianEntity(json: json["physician"])
    
    self.hcr = HcrTeam(json: json["hcr"])
    
    self.team = HcrTeam(json: json["team"])
    
    self.coverage = HcrTeam(json: json["coverage"])
    
    self.patient = PatientEntity(json: json["patient"])
    
    self.implantLoan = WsGetCaseEventDetail.Loan(json: json["implantLoan"])
    
    self.instrumentLoan = WsGetCaseEventDetail.Loan(json: json["instrumentLoan"])
    
    if let linkedOrdersArrayValue = json["linkedOrders"].array {
        self.linkedOrders = []
        for item in linkedOrdersArrayValue {
            if let value = WsGetCaseEventDetail.LinkedOrder(json: item), var linkedOrders = linkedOrders {
                linkedOrders.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let event = self.event {
        dictionary["event"] = event.asDictionary()
    }
    
    if let caseEvent = self.caseEvent {
        dictionary["caseEvent"] = caseEvent.asDictionary()
    }
    
    if let bizUnit = self.bizUnit {
        dictionary["bizUnit"] = bizUnit.asDictionary()
    }
    
    if let opsOrgUnit = self.opsOrgUnit {
        dictionary["opsOrgUnit"] = opsOrgUnit.asDictionary()
    }
    
    if let salesOrgUnit = self.salesOrgUnit {
        dictionary["salesOrgUnit"] = salesOrgUnit.asDictionary()
    }
    
    if let procedure = self.procedure {
        dictionary["procedure"] = procedure.asDictionary()
    }
    
    if let hospital = self.hospital {
        dictionary["hospital"] = hospital.asDictionary()
    }
    
    if let physician = self.physician {
        dictionary["physician"] = physician.asDictionary()
    }
    
    if let hcr = self.hcr {
        dictionary["hcr"] = hcr.asDictionary()
    }
    
    if let team = self.team {
        dictionary["team"] = team.asDictionary()
    }
    
    if let coverage = self.coverage {
        dictionary["coverage"] = coverage.asDictionary()
    }
    
    if let patient = self.patient {
        dictionary["patient"] = patient.asDictionary()
    }
    
    if let implantLoan = self.implantLoan {
        dictionary["implantLoan"] = implantLoan.asDictionary()
    }
    
    if let instrumentLoan = self.instrumentLoan {
        dictionary["instrumentLoan"] = instrumentLoan.asDictionary()
    }
    
    return dictionary
}
}

class Loan: JSONSerializable {
    var loanEntity: LoanEntity?
    var orderId: String?
    var orderNumber: String?

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
    
    self.loanEntity = LoanEntity(json: json["loanEntity"])
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let orderNumber = json["orderNumber"].string {
        self.orderNumber = orderNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let loanEntity = self.loanEntity {
        dictionary["loanEntity"] = loanEntity.asDictionary()
    }
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let orderNumber = self.orderNumber {
        dictionary["orderNumber"] = orderNumber
    }
    
    return dictionary
}
}

}
