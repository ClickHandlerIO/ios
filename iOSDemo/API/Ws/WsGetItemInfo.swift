import Foundation
import SwiftyJSON

struct WsGetItemInfo {

    class Request: WsRequest {
        typealias Response = WsGetItemInfo.Response
        
        var itemNumber: String?
        var lotOrSerialNumber: String?
        
        class func getPath() -> String {
            return "/inventory/item/getiteminfo"
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
            
            if let itemNumber = json["itemNumber"].string {
                self.itemNumber = itemNumber
            }
            
            if let lotOrSerialNumber = json["lotOrSerialNumber"].string {
                self.lotOrSerialNumber = lotOrSerialNumber
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let itemNumber = self.itemNumber {
                dictionary["itemNumber"] = itemNumber
            }
            
            if let lotOrSerialNumber = self.lotOrSerialNumber {
                dictionary["lotOrSerialNumber"] = lotOrSerialNumber
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetItemInfo.Code?
    var item: ItemEntity?
    var lot: LotEntity?
    var serial: SerialEntity?

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
        if let code = WsGetItemInfo.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.item = ItemEntity(json: json["item"])
    
    self.lot = LotEntity(json: json["lot"])
    
    self.serial = SerialEntity(json: json["serial"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let item = self.item {
        dictionary["item"] = item.asDictionary()
    }
    
    if let lot = self.lot {
        dictionary["lot"] = lot.asDictionary()
    }
    
    if let serial = self.serial {
        dictionary["serial"] = serial.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case NOT_FOUND
    case OUT_OF_SCOPE
    case ITEM_NUMBER_REQUIRED
    case ITEM_NOT_FOUND
    case LOT_NOT_FOUND
    case SERIAL_NOT_FOUND
    case FAILED
}

}
