import Foundation
import SwiftyJSON

class OrgInfo: JSONSerializable {
    var bizUnits: [BizUnit]?
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
    
    if let bizUnitsArrayValue = json["bizUnits"].array {
        self.bizUnits = []
        for item in bizUnitsArrayValue {
            if let value = BizUnit(json: item), var bizUnits = bizUnits {
                bizUnits.append(value)
            }
        }
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
    
    return dictionary
}
}
