import Foundation
import SwiftyJSON

struct WsGetOrder {

    class Request: WsRequest {
        typealias Response = WsGetOrder.Response
        
        var orderId: String?
        
        class func getPath() -> String {
            return "/inventory/order/getorder"
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
            
            if let orderId = json["orderId"].string {
                self.orderId = orderId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let orderId = self.orderId {
                dictionary["orderId"] = orderId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetOrder.Code?
    var order: WsGetOrder.Order?

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
        if let code = WsGetOrder.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.order = WsGetOrder.Order(json: json["order"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let order = self.order {
        dictionary["order"] = order.asDictionary()
    }
    
    return dictionary
}
}

class Order: JSONSerializable {
    var orderHeaderEntity: OrderHeaderEntity?
    var orderReasonEntity: OrderReasonEntity?
    var loanEntity: LoanEntity?
    var bizUnitEntity: BizUnitEntity?
    var opOuEntity: OrgUnitEntity?
    var salesOuEntity: OrgUnitEntity?
    var locationName: String?
    var caseEvents: [WsGetOrder.Case]?
    var deliverToAddress: Address?

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
    
    self.orderHeaderEntity = OrderHeaderEntity(json: json["orderHeaderEntity"])
    
    self.orderReasonEntity = OrderReasonEntity(json: json["orderReasonEntity"])
    
    self.loanEntity = LoanEntity(json: json["loanEntity"])
    
    self.bizUnitEntity = BizUnitEntity(json: json["bizUnitEntity"])
    
    self.opOuEntity = OrgUnitEntity(json: json["opOuEntity"])
    
    self.salesOuEntity = OrgUnitEntity(json: json["salesOuEntity"])
    
    if let locationName = json["locationName"].string {
        self.locationName = locationName
    }
    
    if let caseEventsArrayValue = json["caseEvents"].array {
        self.caseEvents = []
        for item in caseEventsArrayValue {
            if let value = WsGetOrder.Case(json: item), var caseEvents = caseEvents {
                caseEvents.append(value)
            }
        }
    }
    
    self.deliverToAddress = Address(json: json["deliverToAddress"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orderHeaderEntity = self.orderHeaderEntity {
        dictionary["orderHeaderEntity"] = orderHeaderEntity.asDictionary()
    }
    
    if let orderReasonEntity = self.orderReasonEntity {
        dictionary["orderReasonEntity"] = orderReasonEntity.asDictionary()
    }
    
    if let loanEntity = self.loanEntity {
        dictionary["loanEntity"] = loanEntity.asDictionary()
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
    
    if let deliverToAddress = self.deliverToAddress {
        dictionary["deliverToAddress"] = deliverToAddress.asDictionary()
    }
    
    return dictionary
}
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

enum Code: String {
    case SUCCESS
    case ORDER_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

}
