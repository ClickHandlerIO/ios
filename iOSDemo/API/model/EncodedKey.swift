import Foundation
import SwiftyJSON

class EncodedKey: JSONSerializable {
    var algorithm: String?
    var key: String?
    var md5: String?

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
    
    if let algorithm = json["algorithm"].string {
        self.algorithm = algorithm
    }
    
    if let key = json["key"].string {
        self.key = key
    }
    
    if let md5 = json["md5"].string {
        self.md5 = md5
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let algorithm = self.algorithm {
        dictionary["algorithm"] = algorithm
    }
    
    if let key = self.key {
        dictionary["key"] = key
    }
    
    if let md5 = self.md5 {
        dictionary["md5"] = md5
    }
    
    return dictionary
}
}
