import Foundation
import SwiftyJSON

struct WsEditCaseEventDetails {

    class Request: WsRequest {
        typealias Response = WsEditCaseEventDetails.Response
        
        var caseEventId: String?
        var bodySide: BodySide?
        var description: String?
        
        class func getPath() -> String {
            return "/event/detail/surgery/editcaseeventdetails"
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
            
            if let bodySide = self.bodySide {
                dictionary["bodySide"] = bodySide.rawValue
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsEditCaseEventDetails.Code?

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
        if let code = WsEditCaseEventDetails.Code(rawValue: codeStringValue) {
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
    case CASE_EVENT_ID_REQUIRED
    case NOT_FOUND
    case BODY_SIDE_REQUIRED
    case FAILED
}

}
