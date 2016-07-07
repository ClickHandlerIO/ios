import Foundation
import SwiftyJSON

struct WsGetUnexpectedItemInfo {

    class Request: WsRequest {
        typealias Response = WsGetUnexpectedItemInfo.Response
        
        var rawTextValue: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/getunxpectediteminfo"
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
            
            if let rawTextValue = json["rawTextValue"].string {
                self.rawTextValue = rawTextValue
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let rawTextValue = self.rawTextValue {
                dictionary["rawTextValue"] = rawTextValue
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetUnexpectedItemInfo.Code?
    var barcodeId: String?
    var barcodeType: BarcodeType?
    var itemId: String?
    var itemNumber: String?
    var itemVersionId: String?
    var itemVersion: String?
    var lotId: String?
    var lotNumber: String?
    var serialId: String?
    var serialNumber: String?
    var tagId: String?
    var tagNumber: String?

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
        if let code = WsGetUnexpectedItemInfo.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let barcodeId = json["barcodeId"].string {
        self.barcodeId = barcodeId
    }
    
    if let barcodeTypeStringValue = json["barcodeType"].string {
        if let barcodeType = BarcodeType(rawValue: barcodeTypeStringValue) {
            self.barcodeType = barcodeType
        }
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let itemVersion = json["itemVersion"].string {
        self.itemVersion = itemVersion
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let serialNumber = json["serialNumber"].string {
        self.serialNumber = serialNumber
    }
    
    if let tagId = json["tagId"].string {
        self.tagId = tagId
    }
    
    if let tagNumber = json["tagNumber"].string {
        self.tagNumber = tagNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let barcodeId = self.barcodeId {
        dictionary["barcodeId"] = barcodeId
    }
    
    if let barcodeType = self.barcodeType {
        dictionary["barcodeType"] = barcodeType.rawValue
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let itemVersion = self.itemVersion {
        dictionary["itemVersion"] = itemVersion
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let tagId = self.tagId {
        dictionary["tagId"] = tagId
    }
    
    if let tagNumber = self.tagNumber {
        dictionary["tagNumber"] = tagNumber
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case RAW_TEXT_REQUIRED
    case INVALID_REQUEST
    case NOT_FOUND
    case FAILED
}

}
