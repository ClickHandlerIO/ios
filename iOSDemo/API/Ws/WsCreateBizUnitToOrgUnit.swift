import Foundation
import SwiftyJSON

struct WsCreateBizUnitToOrgUnit {

    class Request: WsRequest {
        typealias Response = WsCreateBizUnitToOrgUnit.Response
        
        var bizUnitIds: [String]?
        var orgUnitIds: [String]?
        
        class func getPath() -> String {
            return "/dir/bizunittoorgunit/create"
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
            
            if let bizUnitIdsArrayValue = json["bizUnitIds"].array {
                self.bizUnitIds = []
                for item in bizUnitIdsArrayValue {
                    if var bizUnitIds = bizUnitIds, let itemValue = item.string {
                        bizUnitIds.append(itemValue)
                    }
                }
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
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateBizUnitToOrgUnit.Code?

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
        if let code = WsCreateBizUnitToOrgUnit.Code(rawValue: codeStringValue) {
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
    case BIZ_AND_ORG_UNIT_ID_REQUIRED
    case INVALID_REQUEST
    case NON_ROOT_OU_GIVEN
    case OUS_NOT_FOUND
    case FAILED
}

}
