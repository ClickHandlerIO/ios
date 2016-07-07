import Foundation
import SwiftyJSON

struct WsListFacilityOuOptions {

    class Request: WsRequest {
        typealias Response = WsListFacilityOuOptions.Response
        
        var facilityId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/orgunittofacility/listorgunitoptions"
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
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
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
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
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
    var code: WsListFacilityOuOptions.Code?
    var ouOptions: [OuOption]?

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
        if let code = WsListFacilityOuOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let ouOptionsArrayValue = json["ouOptions"].array {
        self.ouOptions = []
        for item in ouOptionsArrayValue {
            if let value = OuOption(json: item), var ouOptions = ouOptions {
                ouOptions.append(value)
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
    case FACILITY_ID_REQUIRED
    case FACILITY_NOT_FOUND
    case FAILED
}

}
