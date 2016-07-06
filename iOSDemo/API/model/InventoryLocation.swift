import Foundation
import SwiftyJSON

class InventoryLocation: JSONSerializable {
    var orgType: OrgType?
    var locationType: LocationType?
    var locationId: String?
    var facilityType: FacilityType?
    var displayText: String?

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
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let locationTypeStringValue = json["locationType"].string {
        if let locationType = LocationType(rawValue: locationTypeStringValue) {
            self.locationType = locationType
        }
    }
    
    if let locationId = json["locationId"].string {
        self.locationId = locationId
    }
    
    if let facilityTypeStringValue = json["facilityType"].string {
        if let facilityType = FacilityType(rawValue: facilityTypeStringValue) {
            self.facilityType = facilityType
        }
    }
    
    if let displayText = json["displayText"].string {
        self.displayText = displayText
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let locationType = self.locationType {
        dictionary["locationType"] = locationType.rawValue
    }
    
    if let locationId = self.locationId {
        dictionary["locationId"] = locationId
    }
    
    if let facilityType = self.facilityType {
        dictionary["facilityType"] = facilityType.rawValue
    }
    
    if let displayText = self.displayText {
        dictionary["displayText"] = displayText
    }
    
    return dictionary
}
}
