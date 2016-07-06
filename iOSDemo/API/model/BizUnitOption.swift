import Foundation
import SwiftyJSON

class BizUnitOption: JSONSerializable {
    var bizUnitId: String?
    var bizUnitName: String?
    var bizUnitDescription: String?

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
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let bizUnitName = json["bizUnitName"].string {
        self.bizUnitName = bizUnitName
    }
    
    if let bizUnitDescription = json["bizUnitDescription"].string {
        self.bizUnitDescription = bizUnitDescription
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let bizUnitName = self.bizUnitName {
        dictionary["bizUnitName"] = bizUnitName
    }
    
    if let bizUnitDescription = self.bizUnitDescription {
        dictionary["bizUnitDescription"] = bizUnitDescription
    }
    
    return dictionary
}
}
