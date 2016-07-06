import Foundation
import SwiftyJSON

class UnexpectedItemResult: JSONSerializable {
    var unexpectedItem: UnexpectedItem?
    var stockEntity: StockEntity?
    var result: Result?

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
    
    self.unexpectedItem = UnexpectedItem(json: json["unexpectedItem"])
    
    self.stockEntity = StockEntity(json: json["stockEntity"])
    
    if let resultStringValue = json["result"].string {
        if let result = Result(rawValue: resultStringValue) {
            self.result = result
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let unexpectedItem = self.unexpectedItem {
        dictionary["unexpectedItem"] = unexpectedItem.asDictionary()
    }
    
    if let stockEntity = self.stockEntity {
        dictionary["stockEntity"] = stockEntity.asDictionary()
    }
    
    if let result = self.result {
        dictionary["result"] = result.rawValue
    }
    
    return dictionary
}
}
