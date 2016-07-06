import Foundation
import SwiftyJSON

class Email: JSONSerializable {
    var user: String?
    var domain: String?
    var suffix: String?

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
    
    if let user = json["user"].string {
        self.user = user
    }
    
    if let domain = json["domain"].string {
        self.domain = domain
    }
    
    if let suffix = json["suffix"].string {
        self.suffix = suffix
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let user = self.user {
        dictionary["user"] = user
    }
    
    if let domain = self.domain {
        dictionary["domain"] = domain
    }
    
    if let suffix = self.suffix {
        dictionary["suffix"] = suffix
    }
    
    return dictionary
}
}
