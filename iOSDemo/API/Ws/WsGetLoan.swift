import Foundation
import SwiftyJSON

struct WsGetLoan {

    class Request: WsRequest {
        typealias Response = WsGetLoan.Response
        
        var loanId: String?
        
        class func getPath() -> String {
            return "/inventory/loan/getloan"
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
            
            if let loanId = json["loanId"].string {
                self.loanId = loanId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let loanId = self.loanId {
                dictionary["loanId"] = loanId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case LOAN_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Case: JSONSerializable {
    var caseEventId: String?
    var caseEventNumber: Int?

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
    
    if let caseEventNumber = json["caseEventNumber"].int {
        self.caseEventNumber = caseEventNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let caseEventId = self.caseEventId {
        dictionary["caseEventId"] = caseEventId
    }
    
    if let caseEventNumber = self.caseEventNumber {
        dictionary["caseEventNumber"] = caseEventNumber
    }
    
    return dictionary
}
}

class Loan: JSONSerializable {
    var loanEntity: LoanEntity?
    var orderHeaderEntity: OrderHeaderEntity?
    var bizUnitEntity: BizUnitEntity?
    var opOuEntity: OrgUnitEntity?
    var salesOuEntity: OrgUnitEntity?
    var locationName: String?
    var caseEvents: [WsGetLoan.Case]?

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
    
    self.orderHeaderEntity = OrderHeaderEntity(json: json["orderHeaderEntity"])
    
    self.bizUnitEntity = BizUnitEntity(json: json["bizUnitEntity"])
    
    self.opOuEntity = OrgUnitEntity(json: json["opOuEntity"])
    
    self.salesOuEntity = OrgUnitEntity(json: json["salesOuEntity"])
    
    if let locationName = json["locationName"].string {
        self.locationName = locationName
    }
    
    if let caseEventsArrayValue = json["caseEvents"].array {
        self.caseEvents = []
        for item in caseEventsArrayValue {
            if let value = WsGetLoan.Case(json: item), var caseEvents = caseEvents {
                caseEvents.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let loanEntity = self.loanEntity {
        dictionary["loanEntity"] = loanEntity.asDictionary()
    }
    
    if let orderHeaderEntity = self.orderHeaderEntity {
        dictionary["orderHeaderEntity"] = orderHeaderEntity.asDictionary()
    }
    
    if let bizUnitEntity = self.bizUnitEntity {
        dictionary["bizUnitEntity"] = bizUnitEntity.asDictionary()
    }
    
    if let opOuEntity = self.opOuEntity {
        dictionary["opOuEntity"] = opOuEntity.asDictionary()
    }
    
    if let salesOuEntity = self.salesOuEntity {
        dictionary["salesOuEntity"] = salesOuEntity.asDictionary()
    }
    
    if let locationName = self.locationName {
        dictionary["locationName"] = locationName
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsGetLoan.Code?
    var loan: WsGetLoan.Loan?

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
        if let code = WsGetLoan.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.loan = WsGetLoan.Loan(json: json["loan"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let loan = self.loan {
        dictionary["loan"] = loan.asDictionary()
    }
    
    return dictionary
}
}

}
