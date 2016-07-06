import Foundation
import SwiftyJSON

class FacilityOption: JSONSerializable {
    var facilityId: String?
    var facilityName: String?
    var facilityType: FacilityType?

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
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let facilityTypeStringValue = json["facilityType"].string {
        if let facilityType = FacilityType(rawValue: facilityTypeStringValue) {
            self.facilityType = facilityType
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let facilityId = self.facilityId {
        dictionary["facilityId"] = facilityId
    }
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let facilityType = self.facilityType {
        dictionary["facilityType"] = facilityType.rawValue
    }
    
    return dictionary
}
}
