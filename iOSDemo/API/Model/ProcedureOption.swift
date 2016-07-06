import Foundation
import SwiftyJSON

class ProcedureOption: JSONSerializable {
    var procedureId: String?
    var name: String?
    var icdCode: String?
    var description: String?

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
    
    if let procedureId = json["procedureId"].string {
        self.procedureId = procedureId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let icdCode = json["icdCode"].string {
        self.icdCode = icdCode
    }
    
    if let description = json["description"].string {
        self.description = description
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let icdCode = self.icdCode {
        dictionary["icdCode"] = icdCode
    }
    
    if let description = self.description {
        dictionary["description"] = description
    }
    
    return dictionary
}
}
