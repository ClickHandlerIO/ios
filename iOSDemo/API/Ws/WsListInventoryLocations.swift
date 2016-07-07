import Foundation
import SwiftyJSON

struct WsListInventoryLocations {

    class Request: WsRequest {
        typealias Response = WsListInventoryLocations.Response
        
        var search: String?
        var orgId: String?
        var bizUnitId: String?
        var locationTypes: [LocationType]?
        var facilityTypes: [FacilityType]?
        
        class func getPath() -> String {
            return "/inventory/listLocations"
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
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let orgId = json["orgId"].string {
                self.orgId = orgId
            }
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
            }
            
            if let locationTypesArrayValue = json["locationTypes"].array {
                self.locationTypes = []
                for item in locationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var locationTypes = locationTypes {
                        locationTypes.append(value)
                    }
                }
            }
            
            if let facilityTypesArrayValue = json["facilityTypes"].array {
                self.facilityTypes = []
                for item in facilityTypesArrayValue {
                    if let value = FacilityType(rawValue: item.stringValue), var facilityTypes = facilityTypes {
                        facilityTypes.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let orgId = self.orgId {
                dictionary["orgId"] = orgId
            }
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NOT_IMPLEMENTED_FOR_USER
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListInventoryLocations.Code?
    var locations: [InventoryLocation]?

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
        if let code = WsListInventoryLocations.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let locationsArrayValue = json["locations"].array {
        self.locations = []
        for item in locationsArrayValue {
            if let value = InventoryLocation(json: item), var locations = locations {
                locations.append(value)
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

}
