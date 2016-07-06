import Foundation
import SwiftyJSON

class CaseViewing: JSONSerializable {
    var id: String?
    var userId: String?
    var name: PersonName?

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
    
    if let userId = json["userId"].string {
        self.userId = userId
    }
    
    self.name = PersonName(json: json["name"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    if let name = self.name {
        dictionary["name"] = name.asDictionary()
    }
    
    return dictionary
}
}
