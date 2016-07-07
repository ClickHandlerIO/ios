import Foundation
import SwiftyJSON

struct WsCreateSerial {

    class Request: WsRequest {
        typealias Response = WsCreateSerial.Response
        
        var itemId: String?
        var itemVersionId: String?
        var serialNumber: Int?
        var stockId: String?
        var tagId: String?
        var serialRef: String?
        var expirationDate: Int?
        var manufactureDate: Int?
        
        class func getPath() -> String {
            return "/inventory/serial/createserial"
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
            
            if let serialNumber = json["serialNumber"].int {
                self.serialNumber = serialNumber
            }
            
            if let stockId = json["stockId"].string {
                self.stockId = stockId
            }
            
            if let tagId = json["tagId"].string {
                self.tagId = tagId
            }
            
            if let serialRef = json["serialRef"].string {
                self.serialRef = serialRef
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
            
            if let serialNumber = self.serialNumber {
                dictionary["serialNumber"] = serialNumber
            }
            
            if let stockId = self.stockId {
                dictionary["stockId"] = stockId
            }
            
            if let tagId = self.tagId {
                dictionary["tagId"] = tagId
            }
            
            if let serialRef = self.serialRef {
                dictionary["serialRef"] = serialRef
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateSerial.Code?
    var serialId: String?

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
        if let code = WsCreateSerial.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case ITEM_VERSION_ID_REQUIRED
    case VALID_SERIAL_NUMBER_REQUIRED
    case ALREADY_EXISTS
    case FAILED
}

}
