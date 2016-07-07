import Foundation
import SwiftyJSON

struct WsCreateOrgUnitToFacility {

    class Request: WsRequest {
        typealias Response = WsCreateOrgUnitToFacility.Response
        
        var orgUnitIds: [String]?
        var facilityIds: [String]?
        
        class func getPath() -> String {
            return "/dir/orgunittofacility/create"
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
            
            if let orgUnitIdsArrayValue = json["orgUnitIds"].array {
                self.orgUnitIds = []
                for item in orgUnitIdsArrayValue {
                    if var orgUnitIds = orgUnitIds, let itemValue = item.string {
                        orgUnitIds.append(itemValue)
                    }
                }
            }
            
            if let facilityIdsArrayValue = json["facilityIds"].array {
                self.facilityIds = []
                for item in facilityIdsArrayValue {
                    if var facilityIds = facilityIds, let itemValue = item.string {
                        facilityIds.append(itemValue)
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
    var code: WsCreateOrgUnitToFacility.Code?

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
        if let code = WsCreateOrgUnitToFacility.Code(rawValue: codeStringValue) {
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
    case ORG_UNIT_AND_FACILITY_ID_REQUIRED
    case INVALID_REQUEST
    case FAILED
}

}
