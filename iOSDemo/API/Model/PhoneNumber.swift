import Foundation
import SwiftyJSON

class PhoneNumber: JSONSerializable {
    var countryCode: String?
    var areaCode: String?
    var phoneNumber: String?
    var extension_: String?

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
    
    if let countryCode = json["countryCode"].string {
        self.countryCode = countryCode
    }
    
    if let areaCode = json["areaCode"].string {
        self.areaCode = areaCode
    }
    
    if let phoneNumber = json["phoneNumber"].string {
        self.phoneNumber = phoneNumber
    }
    
    if let extension_ = json["extension"].string {
        self.extension_ = extension_
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let countryCode = self.countryCode {
        dictionary["countryCode"] = countryCode
    }
    
    if let areaCode = self.areaCode {
        dictionary["areaCode"] = areaCode
    }
    
    if let phoneNumber = self.phoneNumber {
        dictionary["phoneNumber"] = phoneNumber
    }
    
    if let extension_ = self.extension_ {
        dictionary["extension"] = extension_
    }
    
    return dictionary
}
}
