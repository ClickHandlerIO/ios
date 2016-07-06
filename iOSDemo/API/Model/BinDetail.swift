import Foundation
import SwiftyJSON

class BinDetail: JSONSerializable {
    var id: String?
    var facilityId: String?
    var facilityName: String?
    var name: String?

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
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let name = json["name"].string {
        self.name = name
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
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    return dictionary
}
}
