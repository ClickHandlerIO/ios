import Foundation
import SwiftyJSON

struct WsAddAeToOrgUnit {

    class Request: WsRequest {
        typealias Response = WsAddAeToOrgUnit.Response
        
        var aeId: String?
        var orgUnitIds: [String]?
        
        class func getPath() -> String {
            return "/dir/relationship/aetoorgunit/addaetoorgunit"
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
            
            if let aeId = json["aeId"].string {
                self.aeId = aeId
            }
            
            if let orgUnitIdsArrayValue = json["orgUnitIds"].array {
                self.orgUnitIds = []
                for item in orgUnitIdsArrayValue {
                    if var orgUnitIds = orgUnitIds, let itemValue = item.string {
                        orgUnitIds.append(itemValue)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let aeId = self.aeId {
                dictionary["aeId"] = aeId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsAddAeToOrgUnit.Code?

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
        if let code = WsAddAeToOrgUnit.Code(rawValue: codeStringValue) {
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
    case NOT_FOUND
    case AE_ID_REQUIRED
    case ORG_UNIT_ID_REQUIRED
    case AE_NOT_FOUND
    case ORG_UNIT_NOT_FOUND
    case INVALID
    case FAILED
}

}
