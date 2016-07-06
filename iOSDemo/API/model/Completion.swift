import Foundation
import SwiftyJSON

class Completion: JSONSerializable {
    var pickId: String?
    var toContainerType: StockContainerType?
    var toContainerId: String?
    var stockId: String?
    var outcome: Outcome?
    var outcomeNote: String?

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
    
    if let pickId = json["pickId"].string {
        self.pickId = pickId
    }
    
    if let toContainerTypeStringValue = json["toContainerType"].string {
        if let toContainerType = StockContainerType(rawValue: toContainerTypeStringValue) {
            self.toContainerType = toContainerType
        }
    }
    
    if let toContainerId = json["toContainerId"].string {
        self.toContainerId = toContainerId
    }
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
    
    if let outcomeStringValue = json["outcome"].string {
        if let outcome = Outcome(rawValue: outcomeStringValue) {
            self.outcome = outcome
        }
    }
    
    if let outcomeNote = json["outcomeNote"].string {
        self.outcomeNote = outcomeNote
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let pickId = self.pickId {
        dictionary["pickId"] = pickId
    }
    
    if let toContainerType = self.toContainerType {
        dictionary["toContainerType"] = toContainerType.rawValue
    }
    
    if let toContainerId = self.toContainerId {
        dictionary["toContainerId"] = toContainerId
    }
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    if let outcome = self.outcome {
        dictionary["outcome"] = outcome.rawValue
    }
    
    if let outcomeNote = self.outcomeNote {
        dictionary["outcomeNote"] = outcomeNote
    }
    
    return dictionary
}
}
