import Foundation
import SwiftyJSON

struct WsRescheduleEvent {

    class Request: WsRequest {
        typealias Response = WsRescheduleEvent.Response
        
        var eventId: String?
        var eventDate: Int?
        
        class func getPath() -> String {
            return "/event/detail/rescheduleevent"
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
            
            if let eventId = json["eventId"].string {
                self.eventId = eventId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let eventId = self.eventId {
                dictionary["eventId"] = eventId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsRescheduleEvent.Code?

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
        if let code = WsRescheduleEvent.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case EVENT_ID_REQUIRED
    case NOT_FOUND
    case EVENT_DATE_REQUIRED
    case EVENT_BUSY
    case CASE_EVENT_NOT_FOUND
    case CASE_EVENT_BUSY
    case LOAN_BUSY
    case SHIPMENT_BUSY
    case PICK_BUSY
    case ORDER_BUSY
    case STOCK_BUSY
    case FAILED
}

}
