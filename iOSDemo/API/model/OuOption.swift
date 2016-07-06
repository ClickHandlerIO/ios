import Foundation
import SwiftyJSON

class OuOption: JSONSerializable {
    var orgUnitId: String?
    var orgUnitName: String?
    var description: String?
    var label: String?

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
    
    if let orgUnitName = json["orgUnitName"].string {
        self.orgUnitName = orgUnitName
    }
    
    if let description = json["description"].string {
        self.description = description
    }
    
    if let label = json["label"].string {
        self.label = label
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orgUnitId = self.orgUnitId {
        dictionary["orgUnitId"] = orgUnitId
    }
    
    if let orgUnitName = self.orgUnitName {
        dictionary["orgUnitName"] = orgUnitName
    }
    
    if let description = self.description {
        dictionary["description"] = description
    }
    
    if let label = self.label {
        dictionary["label"] = label
    }
    
    return dictionary
}
}
