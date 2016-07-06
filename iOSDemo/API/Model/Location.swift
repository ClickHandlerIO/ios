import Foundation
import SwiftyJSON

class Location: JSONSerializable {
    var locationType: LocationType?
    var locationId: String?
    var locationName: String?

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
    
    if let locationTypeStringValue = json["locationType"].string {
        if let locationType = LocationType(rawValue: locationTypeStringValue) {
            self.locationType = locationType
        }
    }
    
    if let locationId = json["locationId"].string {
        self.locationId = locationId
    }
    
    if let locationName = json["locationName"].string {
        self.locationName = locationName
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let locationType = self.locationType {
        dictionary["locationType"] = locationType.rawValue
    }
    
    if let locationId = self.locationId {
        dictionary["locationId"] = locationId
    }
    
    if let locationName = self.locationName {
        dictionary["locationName"] = locationName
    }
    
    return dictionary
}
}
