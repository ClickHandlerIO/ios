import Foundation
import SwiftyJSON

class BizUnitRelation: JSONSerializable {
    var id: String?
    var bizUnitId: String?
    var bizUnitName: String?
    var bizUnitDescription: String?
    var bizUnitActive: Bool?

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
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let bizUnitName = json["bizUnitName"].string {
        self.bizUnitName = bizUnitName
    }
    
    if let bizUnitDescription = json["bizUnitDescription"].string {
        self.bizUnitDescription = bizUnitDescription
    }
    
    if let bizUnitActive = json["bizUnitActive"].bool {
        self.bizUnitActive = bizUnitActive
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let bizUnitName = self.bizUnitName {
        dictionary["bizUnitName"] = bizUnitName
    }
    
    if let bizUnitDescription = self.bizUnitDescription {
        dictionary["bizUnitDescription"] = bizUnitDescription
    }
    
    if let bizUnitActive = self.bizUnitActive {
        dictionary["bizUnitActive"] = bizUnitActive
    }
    
    return dictionary
}
}
