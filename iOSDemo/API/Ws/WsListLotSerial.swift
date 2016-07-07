import Foundation
import SwiftyJSON

struct WsListLotSerial {

    class Request: WsRequest {
        typealias Response = WsListLotSerial.Response
        
        var itemId: String?
        var itemVersionId: String?
        var search: String?
        
        class func getPath() -> String {
            return "/inventory/item/listlotserial"
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
            
            if let search = json["search"].string {
                self.search = search
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
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class LotSerialItem: JSONSerializable {
    var lot: LotEntity?
    var serial: SerialEntity?
    var itemVersionId: String?
    var itemVersion: String?

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
    
    self.lot = LotEntity(json: json["lot"])
    
    self.serial = SerialEntity(json: json["serial"])
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let itemVersion = json["itemVersion"].string {
        self.itemVersion = itemVersion
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let lot = self.lot {
        dictionary["lot"] = lot.asDictionary()
    }
    
    if let serial = self.serial {
        dictionary["serial"] = serial.asDictionary()
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let itemVersion = self.itemVersion {
        dictionary["itemVersion"] = itemVersion
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case NOT_IMPLEMENTED
    case ITEM_ID_REQUIRED
    case ITEM_OR_VERSION_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListLotSerial.Code?
    var lots: [WsListLotSerial.LotSerialItem]?
    var serials: [WsListLotSerial.LotSerialItem]?

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
        if let code = WsListLotSerial.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let lotsArrayValue = json["lots"].array {
        self.lots = []
        for item in lotsArrayValue {
            if let value = WsListLotSerial.LotSerialItem(json: item), var lots = lots {
                lots.append(value)
            }
        }
    }
    
    if let serialsArrayValue = json["serials"].array {
        self.serials = []
        for item in serialsArrayValue {
            if let value = WsListLotSerial.LotSerialItem(json: item), var serials = serials {
                serials.append(value)
            }
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
