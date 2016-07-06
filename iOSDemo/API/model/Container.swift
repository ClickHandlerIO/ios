import Foundation
import SwiftyJSON

class Container: JSONSerializable {
    var containerType: StockContainerType?
    var containerId: String?
    var containerDisplayText: String?
    var numberOfPieces: Int?
    var weight: Double?

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
    
    if let containerTypeStringValue = json["containerType"].string {
        if let containerType = StockContainerType(rawValue: containerTypeStringValue) {
            self.containerType = containerType
        }
    }
    
    if let containerId = json["containerId"].string {
        self.containerId = containerId
    }
    
    if let containerDisplayText = json["containerDisplayText"].string {
        self.containerDisplayText = containerDisplayText
    }
    
    if let numberOfPieces = json["numberOfPieces"].int {
        self.numberOfPieces = numberOfPieces
    }
    
    if let weight = json["weight"].double {
        self.weight = weight
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let containerType = self.containerType {
        dictionary["containerType"] = containerType.rawValue
    }
    
    if let containerId = self.containerId {
        dictionary["containerId"] = containerId
    }
    
    if let containerDisplayText = self.containerDisplayText {
        dictionary["containerDisplayText"] = containerDisplayText
    }
    
    if let numberOfPieces = self.numberOfPieces {
        dictionary["numberOfPieces"] = numberOfPieces
    }
    
    if let weight = self.weight {
        dictionary["weight"] = weight
    }
    
    return dictionary
}
}
