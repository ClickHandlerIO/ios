import Foundation
import SwiftyJSON

struct WsListOuFacilityOptions {

    class Request: WsRequest {
        typealias Response = WsListOuFacilityOptions.Response
        
        var orgUnitId: String?
        var type_: WsListOuFacilityOptions.Type_?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/orgunittofacility/listfacilityoptions"
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
            
            if let orgUnitId = json["orgUnitId"].string {
                self.orgUnitId = orgUnitId
            }
            
            if let type_StringValue = json["type"].string {
                if let type_ = WsListOuFacilityOptions.Type_(rawValue: type_StringValue) {
                    self.type_ = type_
                }
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
            
            if let orgUnitId = self.orgUnitId {
                dictionary["orgUnitId"] = orgUnitId
            }
            
            if let type_ = self.type_ {
                dictionary["type"] = type_.rawValue
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

enum Code: String {
    case SUCCESS
    case ORG_UNIT_ID_REQUIRED
    case TYPE_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListOuFacilityOptions.Code?
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
        if let code = WsListOuFacilityOptions.Code(rawValue: codeStringValue) {
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

enum Type_: String {
    case MDC_FACILITIES
    case HS_FACILITIES
    case BOTH
}

}
