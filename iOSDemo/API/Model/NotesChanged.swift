import Foundation
import SwiftyJSON

class NotesChanged: JSONSerializable {
    var attrId: String?

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
    
    if let attrId = json["attrId"].string {
        self.attrId = attrId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let attrId = self.attrId {
        dictionary["attrId"] = attrId
    }
    
    return dictionary
}
}
