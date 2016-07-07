import Foundation
import SwiftyJSON

struct WsCancelCaseEvent {

    class Request: WsRequest {
        typealias Response = WsCancelCaseEvent.Response
        
        var caseEventId: String?
        var cancelReason: CancelReason?
        var note: String?
        
        class func getPath() -> String {
            return "/event/detail/surgery/cancelcaseevent"
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
            
            if let cancelReasonStringValue = json["cancelReason"].string {
                if let cancelReason = CancelReason(rawValue: cancelReasonStringValue) {
                    self.cancelReason = cancelReason
                }
            }
            
            if let note = json["note"].string {
                self.note = note
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
            }
            
            if let cancelReason = self.cancelReason {
                dictionary["cancelReason"] = cancelReason.rawValue
            }
            
            if let note = self.note {
                dictionary["note"] = note
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case REASON_REQUIRED
    case NOT_FOUND
    case NOTE_REQUIRED_W_OTHER
    case EVENT_NOT_FOUND
    case CASE_BUSY
    case EVENT_BUSY
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCancelCaseEvent.Code?

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
        if let code = WsCancelCaseEvent.Code(rawValue: codeStringValue) {
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
