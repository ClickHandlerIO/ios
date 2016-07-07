import Foundation
import SwiftyJSON

struct WsUpdateCaseEventOpsStatus {

    class Request: WsRequest {
        typealias Response = WsUpdateCaseEventOpsStatus.Response
        
        var caseEventId: String?
        var caseEventOpsStatus: CaseEventOpsStatus?
        
        class func getPath() -> String {
            return "/event/detail/surgery/updatecaseeventopsstatus"
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
            
            if let caseEventOpsStatusStringValue = json["caseEventOpsStatus"].string {
                if let caseEventOpsStatus = CaseEventOpsStatus(rawValue: caseEventOpsStatusStringValue) {
                    self.caseEventOpsStatus = caseEventOpsStatus
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
            }
            
            if let caseEventOpsStatus = self.caseEventOpsStatus {
                dictionary["caseEventOpsStatus"] = caseEventOpsStatus.rawValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case STATUS_REQUIRED
    case NOT_FOUND
    case EVENT_NOT_FOUND
    case CASE_EVENT_BUSY
    case EVENT_BUSY
    case LOAN_BUSY
    case ORDER_BUSY
    case PICK_BUSY
    case STOCK_BUSY
    case SHIPMENT_BUSY
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUpdateCaseEventOpsStatus.Code?

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
        if let code = WsUpdateCaseEventOpsStatus.Code(rawValue: codeStringValue) {
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
