import Foundation
import SwiftyJSON

struct WsPendingPoReport {

    class Request: WsRequest {
        typealias Response = WsPendingPoReport.Response
        
        var startDate: Int?
        var endDate: Int?
        
        class func getPath() -> String {
            return "/inventory/reports/pendingpo"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

class PoReportData: JSONSerializable {
    var facilityName: String?
    var date: Int?
    var caseEventId: String?
    var caseNumber: Int?
    var orderId: String?
    var orderNumber: Int?
    var grandTotal: Double?

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
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let caseEventId = json["caseEventId"].string {
        self.caseEventId = caseEventId
    }
    
    if let caseNumber = json["caseNumber"].int {
        self.caseNumber = caseNumber
    }
    
    if let orderId = json["orderId"].string {
        self.orderId = orderId
    }
    
    if let orderNumber = json["orderNumber"].int {
        self.orderNumber = orderNumber
    }
    
    if let grandTotal = json["grandTotal"].double {
        self.grandTotal = grandTotal
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let caseEventId = self.caseEventId {
        dictionary["caseEventId"] = caseEventId
    }
    
    if let caseNumber = self.caseNumber {
        dictionary["caseNumber"] = caseNumber
    }
    
    if let orderId = self.orderId {
        dictionary["orderId"] = orderId
    }
    
    if let orderNumber = self.orderNumber {
        dictionary["orderNumber"] = orderNumber
    }
    
    if let grandTotal = self.grandTotal {
        dictionary["grandTotal"] = grandTotal
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsPendingPoReport.Code?
    var data: [WsPendingPoReport.PoReportData]?

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
        if let code = WsPendingPoReport.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let dataArrayValue = json["data"].array {
        self.data = []
        for item in dataArrayValue {
            if let value = WsPendingPoReport.PoReportData(json: item), var data = data {
                data.append(value)
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
    case CONTEXT_REQUIRED
    case START_AND_END_DATE_REQUIRED
    case FAILED
}

}
