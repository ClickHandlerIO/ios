import Foundation
import SwiftyJSON

class PersonName: JSONSerializable {
    var title: String?
    var givenName: String?
    var middleName: String?
    var familyName: String?
    var suffix: String?
    var fullName: String?
    var displayName: String?
    var locale: Int?

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
    
    if let title = json["title"].string {
        self.title = title
    }
    
    if let givenName = json["givenName"].string {
        self.givenName = givenName
    }
    
    if let middleName = json["middleName"].string {
        self.middleName = middleName
    }
    
    if let familyName = json["familyName"].string {
        self.familyName = familyName
    }
    
    if let suffix = json["suffix"].string {
        self.suffix = suffix
    }
    
    if let fullName = json["fullName"].string {
        self.fullName = fullName
    }
    
    if let displayName = json["displayName"].string {
        self.displayName = displayName
    }
    
    if let locale = json["locale"].int {
        self.locale = locale
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let title = self.title {
        dictionary["title"] = title
    }
    
    if let givenName = self.givenName {
        dictionary["givenName"] = givenName
    }
    
    if let middleName = self.middleName {
        dictionary["middleName"] = middleName
    }
    
    if let familyName = self.familyName {
        dictionary["familyName"] = familyName
    }
    
    if let suffix = self.suffix {
        dictionary["suffix"] = suffix
    }
    
    if let fullName = self.fullName {
        dictionary["fullName"] = fullName
    }
    
    if let displayName = self.displayName {
        dictionary["displayName"] = displayName
    }
    
    if let locale = self.locale {
        dictionary["locale"] = locale
    }
    
    return dictionary
}
}
