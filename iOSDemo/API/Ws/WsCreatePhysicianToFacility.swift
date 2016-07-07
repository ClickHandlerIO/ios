import Foundation
import SwiftyJSON

struct WsCreatePhysicianToFacility {

    class Request: WsRequest {
        typealias Response = WsCreatePhysicianToFacility.Response
        
        var physicianIds: [String]?
        var facilityIds: [String]?
        
        class func getPath() -> String {
            return "/dir/physiciantofacility/create"
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
            
            if let physicianIdsArrayValue = json["physicianIds"].array {
                self.physicianIds = []
                for item in physicianIdsArrayValue {
                    if var physicianIds = physicianIds, let itemValue = item.string {
                        physicianIds.append(itemValue)
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

enum Code: String {
    case SUCCESS
    case PHYSICIAN_AND_FACILITY_ID_REQUIRED
    case INVALID_REQUEST
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreatePhysicianToFacility.Code?

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
        if let code = WsCreatePhysicianToFacility.Code(rawValue: codeStringValue) {
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
