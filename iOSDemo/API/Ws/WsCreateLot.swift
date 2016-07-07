import Foundation
import SwiftyJSON

struct WsCreateLot {

    class Request: WsRequest {
        typealias Response = WsCreateLot.Response
        
        var itemId: String?
        var itemVersionId: String?
        var lotNumber: String?
        var expirationDate: Int?
        var manufactureDate: Int?
        
        class func getPath() -> String {
            return "/inventory/lot/createlot"
        }
        
        class func isQueueable() -> Bool {
            return false
        }
        
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
            
            if let itemId = json["itemId"].string {
                self.itemId = itemId
            }
            
            if let itemVersionId = json["itemVersionId"].string {
                self.itemVersionId = itemVersionId
            }
            
            if let lotNumber = json["lotNumber"].string {
                self.lotNumber = lotNumber
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemId = self.itemId {
                dictionary["itemId"] = itemId
            }
            
            if let itemVersionId = self.itemVersionId {
                dictionary["itemVersionId"] = itemVersionId
            }
            
            if let lotNumber = self.lotNumber {
                dictionary["lotNumber"] = lotNumber
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateLot.Code?
    var lotId: String?

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
    
    if let codeStringValue = json["code"].string {
        if let code = WsCreateLot.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case ITEM_VERSION_ID_REQUIRED
    case LOT_NUMBER_REQUIRED
    case ALREADY_EXISTS
    case FAILED
}

}
