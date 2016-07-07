import Foundation
import SwiftyJSON

struct WsSaveCaseUsages {

    class Request: WsRequest {
        typealias Response = WsSaveCaseUsages.Response
        
        var caseEventId: String?
        var usages: [WsSaveCaseUsages.Usage]?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/savecaseusages"
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
            
            if let caseEventId = json["caseEventId"].string {
                self.caseEventId = caseEventId
            }
            
            if let usagesArrayValue = json["usages"].array {
                self.usages = []
                for item in usagesArrayValue {
                    if let value = WsSaveCaseUsages.Usage(json: item), var usages = usages {
                        usages.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
            }
            
            return dictionary
        }
    }

class Usage: JSONSerializable {
    var id: String?
    var remove: Bool?
    var itemId: String?
    var lotId: String?
    var serialId: String?
    var itemNumber: String?
    var lotSerialNumber: String?
    var rawBarcodeData: String?
    var caseUsageDisposition: CaseUsageDisposition?
    var usageCaptureType: UsageCaptureType?
    var quantity: Int?
    var note: String?
    var stockId: String?
    var locationHint: LocationHint?

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
    
    if let remove = json["remove"].bool {
        self.remove = remove
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let lotSerialNumber = json["lotSerialNumber"].string {
        self.lotSerialNumber = lotSerialNumber
    }
    
    if let rawBarcodeData = json["rawBarcodeData"].string {
        self.rawBarcodeData = rawBarcodeData
    }
    
    if let caseUsageDispositionStringValue = json["caseUsageDisposition"].string {
        if let caseUsageDisposition = CaseUsageDisposition(rawValue: caseUsageDispositionStringValue) {
            self.caseUsageDisposition = caseUsageDisposition
        }
    }
    
    if let usageCaptureTypeStringValue = json["usageCaptureType"].string {
        if let usageCaptureType = UsageCaptureType(rawValue: usageCaptureTypeStringValue) {
            self.usageCaptureType = usageCaptureType
        }
    }
    
    if let quantity = json["quantity"].int {
        self.quantity = quantity
    }
    
    if let note = json["note"].string {
        self.note = note
    }
    
    if let stockId = json["stockId"].string {
        self.stockId = stockId
    }
    
    if let locationHintStringValue = json["locationHint"].string {
        if let locationHint = LocationHint(rawValue: locationHintStringValue) {
            self.locationHint = locationHint
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let remove = self.remove {
        dictionary["remove"] = remove
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let lotSerialNumber = self.lotSerialNumber {
        dictionary["lotSerialNumber"] = lotSerialNumber
    }
    
    if let rawBarcodeData = self.rawBarcodeData {
        dictionary["rawBarcodeData"] = rawBarcodeData
    }
    
    if let caseUsageDisposition = self.caseUsageDisposition {
        dictionary["caseUsageDisposition"] = caseUsageDisposition.rawValue
    }
    
    if let usageCaptureType = self.usageCaptureType {
        dictionary["usageCaptureType"] = usageCaptureType.rawValue
    }
    
    if let quantity = self.quantity {
        dictionary["quantity"] = quantity
    }
    
    if let note = self.note {
        dictionary["note"] = note
    }
    
    if let stockId = self.stockId {
        dictionary["stockId"] = stockId
    }
    
    if let locationHint = self.locationHint {
        dictionary["locationHint"] = locationHint.rawValue
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsSaveCaseUsages.Code?

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
        if let code = WsSaveCaseUsages.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case CASE_EVENT_ID_REQUIRED
    case USAGE_REQUIRED
    case DISPOSITION_REQUIRED
    case USAGE_CAPTURE_TYPE_REQUIRED
    case INVALID_QUANTITY
    case NOT_FOUND
    case ITEM_NUMBER_OR_ID_REQUIRED
    case STOCK_NOT_FOUND
    case ITEM_NOT_FOUND
    case LOT_NOT_FOUND
    case USAGE_ALREADY_ADJUSTED
    case FAILED
}

}
