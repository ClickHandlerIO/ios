import Foundation
import SwiftyJSON

class OrgUnit: JSONSerializable {
    var id: String?
    var name: String?
    var label: String?
    var bizUnits: [BizUnit]?

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
    
    if let label = json["label"].string {
        self.label = label
    }
    
    if let bizUnitsArrayValue = json["bizUnits"].array {
        self.bizUnits = []
        for item in bizUnitsArrayValue {
            if let value = BizUnit(json: item), var bizUnits = bizUnits {
                bizUnits.append(value)
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
    
    if let label = self.label {
        dictionary["label"] = label
    }
    
    return dictionary
}
}
