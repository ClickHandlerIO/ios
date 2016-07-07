import Foundation
import SwiftyJSON

struct WsEditSerial {

    class Request: WsRequest {
        typealias Response = WsEditSerial.Response
        
        var id: String?
        var itemVersionId: String?
        var serialNumber: Int?
        var stockId: String?
        var tagId: String?
        var serialRef: String?
        var expirationDate: Int?
        var manufactureDate: Int?
        
        class func getPath() -> String {
            return "/inventory/serial/editserial"
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
            
            if let id = json["id"].string {
                self.id = id
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
            
            if let id = self.id {
                dictionary["id"] = id
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

enum Code: String {
    case SUCCESS
    case ID_REQUIRED
    case VALID_SERIAL_NUMBER_REQUIRED
    case NOT_FOUND
    case DUPLICATE_SERIAL
    case ITEM_VERSION_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsEditSerial.Code?

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
        if let code = WsEditSerial.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    return dictionary
}
}

}
