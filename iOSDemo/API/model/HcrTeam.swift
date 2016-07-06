import Foundation
import SwiftyJSON

class HcrTeam: JSONSerializable {
    var id: String?
    var displayText: String?
    var salesOuId: String?
    var salesOuName: String?
    var type_: HcrTeamType?

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
    
    if let displayText = json["displayText"].string {
        self.displayText = displayText
    }
    
    if let salesOuId = json["salesOuId"].string {
        self.salesOuId = salesOuId
    }
    
    if let salesOuName = json["salesOuName"].string {
        self.salesOuName = salesOuName
    }
    
    if let type_StringValue = json["type"].string {
        if let type_ = HcrTeamType(rawValue: type_StringValue) {
            self.type_ = type_
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let displayText = self.displayText {
        dictionary["displayText"] = displayText
    }
    
    if let salesOuId = self.salesOuId {
        dictionary["salesOuId"] = salesOuId
    }
    
    if let salesOuName = self.salesOuName {
        dictionary["salesOuName"] = salesOuName
    }
    
    if let type_ = self.type_ {
        dictionary["type"] = type_.rawValue
    }
    
    return dictionary
}
}
