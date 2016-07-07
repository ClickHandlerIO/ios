import Foundation
import SwiftyJSON

struct WsEditCaseUsage {

    class Request: WsRequest {
        typealias Response = WsEditCaseUsage.Response
        
        var id: String?
        var caseUsageDisposition: CaseUsageDisposition?
        var locationHint: LocationHint?
        var note: String?
        var stockId: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/editcaseusage"
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
            
            if let caseUsageDispositionStringValue = json["caseUsageDisposition"].string {
                if let caseUsageDisposition = CaseUsageDisposition(rawValue: caseUsageDispositionStringValue) {
                    self.caseUsageDisposition = caseUsageDisposition
                }
            }
            
            if let locationHintStringValue = json["locationHint"].string {
                if let locationHint = LocationHint(rawValue: locationHintStringValue) {
                    self.locationHint = locationHint
                }
            }
            
            if let note = json["note"].string {
                self.note = note
            }
            
            if let stockId = json["stockId"].string {
                self.stockId = stockId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let caseUsageDisposition = self.caseUsageDisposition {
                dictionary["caseUsageDisposition"] = caseUsageDisposition.rawValue
            }
            
            if let locationHint = self.locationHint {
                dictionary["locationHint"] = locationHint.rawValue
            }
            
            if let note = self.note {
                dictionary["note"] = note
            }
            
            if let stockId = self.stockId {
                dictionary["stockId"] = stockId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsEditCaseUsage.Code?

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
        if let code = WsEditCaseUsage.Code(rawValue: codeStringValue) {
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
    case USAGE_ID_REQUIRED
    case DISPOSITION_REQUIRED
    case NOT_FOUND
    case STOCK_NOT_FOUND
    case FAILED
}

}
