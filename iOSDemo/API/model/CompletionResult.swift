import Foundation
import SwiftyJSON

class CompletionResult: JSONSerializable {
    var pickId: String?
    var result: PickResult?

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
    
    if let resultStringValue = json["result"].string {
        if let result = PickResult(rawValue: resultStringValue) {
            self.result = result
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let pickId = self.pickId {
        dictionary["pickId"] = pickId
    }
    
    if let result = self.result {
        dictionary["result"] = result.rawValue
    }
    
    return dictionary
}
}
