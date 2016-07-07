import Foundation
import SwiftyJSON

struct WsListPhysicianFacilityOptions {

    class Request: WsRequest {
        typealias Response = WsListPhysicianFacilityOptions.Response
        
        var physicianId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/physiciantofacility/listfacilityoptions"
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
            
            if let physicianId = json["physicianId"].string {
                self.physicianId = physicianId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let physicianId = self.physicianId {
                dictionary["physicianId"] = physicianId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListPhysicianFacilityOptions.Code?
    var facilityOptions: [FacilityOption]?

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
        if let code = WsListPhysicianFacilityOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let facilityOptionsArrayValue = json["facilityOptions"].array {
        self.facilityOptions = []
        for item in facilityOptionsArrayValue {
            if let value = FacilityOption(json: item), var facilityOptions = facilityOptions {
                facilityOptions.append(value)
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
    case PHYSICIAN_ID_REQUIRED
    case FAILED
}

}
