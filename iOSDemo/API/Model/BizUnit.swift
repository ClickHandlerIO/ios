import Foundation
import SwiftyJSON

class BizUnit: JSONSerializable {
    var id: String?
    var name: String?
    var orgUnits: [OrgUnit]?

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
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let orgUnitsArrayValue = json["orgUnits"].array {
        self.orgUnits = []
        for item in orgUnitsArrayValue {
            if let value = OrgUnit(json: item), var orgUnits = orgUnits {
                orgUnits.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    return dictionary
}
}
