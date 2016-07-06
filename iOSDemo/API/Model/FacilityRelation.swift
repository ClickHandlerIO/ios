import Foundation
import SwiftyJSON

class FacilityRelation: JSONSerializable {
    var id: String?
    var facilityId: String?
    var facilityType: FacilityType?
    var facilityName: String?
    var facilityActive: Bool?

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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let facilityId = json["facilityId"].string {
        self.facilityId = facilityId
    }
    
    if let facilityTypeStringValue = json["facilityType"].string {
        if let facilityType = FacilityType(rawValue: facilityTypeStringValue) {
            self.facilityType = facilityType
        }
    }
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let facilityActive = json["facilityActive"].bool {
        self.facilityActive = facilityActive
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let facilityId = self.facilityId {
        dictionary["facilityId"] = facilityId
    }
    
    if let facilityType = self.facilityType {
        dictionary["facilityType"] = facilityType.rawValue
    }
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let facilityActive = self.facilityActive {
        dictionary["facilityActive"] = facilityActive
    }
    
    return dictionary
}
}
