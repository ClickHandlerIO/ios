import Foundation
import SwiftyJSON

class Address: JSONSerializable {
    var line1: String?
    var line2: String?
    var line3: String?
    var city: String?
    var state: String?
    var postalCode: String?
    var country: String?

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
    
    if let line1 = json["line1"].string {
        self.line1 = line1
    }
    
    if let line2 = json["line2"].string {
        self.line2 = line2
    }
    
    if let line3 = json["line3"].string {
        self.line3 = line3
    }
    
    if let city = json["city"].string {
        self.city = city
    }
    
    if let state = json["state"].string {
        self.state = state
    }
    
    if let postalCode = json["postalCode"].string {
        self.postalCode = postalCode
    }
    
    if let country = json["country"].string {
        self.country = country
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let line1 = self.line1 {
        dictionary["line1"] = line1
    }
    
    if let line2 = self.line2 {
        dictionary["line2"] = line2
    }
    
    if let line3 = self.line3 {
        dictionary["line3"] = line3
    }
    
    if let city = self.city {
        dictionary["city"] = city
    }
    
    if let state = self.state {
        dictionary["state"] = state
    }
    
    if let postalCode = self.postalCode {
        dictionary["postalCode"] = postalCode
    }
    
    if let country = self.country {
        dictionary["country"] = country
    }
    
    return dictionary
}
}
