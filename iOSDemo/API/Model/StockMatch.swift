import Foundation
import SwiftyJSON

class StockMatch: JSONSerializable {
    var lost: Stock?
    var found: Stock?

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
    
    self.lost = Stock(json: json["lost"])
    
    self.found = Stock(json: json["found"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let lost = self.lost {
        dictionary["lost"] = lost.asDictionary()
    }
    
    if let found = self.found {
        dictionary["found"] = found.asDictionary()
    }
    
    return dictionary
}
}
