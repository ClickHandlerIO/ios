import Foundation
import SwiftyJSON

struct WsSwapStockForPick {

    class Request: WsRequest {
        typealias Response = WsSwapStockForPick.Response
        
        var picks: [WsSwapStockForPick.Pick]?
        var scannedItem: WsSwapStockForPick.ScannedItem?
        var scannedItemContainer: Container?
        var packageContainer: Container?
        
        class func getPath() -> String {
            return "/inventory/sourcing/swapstockforpick"
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
            
            if let picksArrayValue = json["picks"].array {
                self.picks = []
                for item in picksArrayValue {
                    if let value = WsSwapStockForPick.Pick(json: item), var picks = picks {
                        picks.append(value)
                    }
                }
            }
            
            self.scannedItem = WsSwapStockForPick.ScannedItem(json: json["scannedItem"])
            
            self.scannedItemContainer = Container(json: json["scannedItemContainer"])
            
            self.packageContainer = Container(json: json["packageContainer"])
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let scannedItem = self.scannedItem {
                dictionary["scannedItem"] = scannedItem.asDictionary()
            }
            
            if let scannedItemContainer = self.scannedItemContainer {
                dictionary["scannedItemContainer"] = scannedItemContainer.asDictionary()
            }
            
            if let packageContainer = self.packageContainer {
                dictionary["packageContainer"] = packageContainer.asDictionary()
            }
            
            return dictionary
        }
    }

class ScannedItem: JSONSerializable {
    var itemNumber: String?
    var lotNumber: String?
    var serialNumber: Int?
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
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialNumber = json["serialNumber"].int {
        self.serialNumber = serialNumber
    }
    
    if let tagNumber = json["tagNumber"].string {
        self.tagNumber = tagNumber
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let tagNumber = self.tagNumber {
        dictionary["tagNumber"] = tagNumber
    }
    
    return dictionary
}
}

class Pick: JSONSerializable {
    var id: String?
    var sourcedStockId: String?
    var pickedStockId: String?
    var containerType: StockContainerType?
    var containerId: String?

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
    
    if let sourcedStockId = json["sourcedStockId"].string {
        self.sourcedStockId = sourcedStockId
    }
    
    if let pickedStockId = json["pickedStockId"].string {
        self.pickedStockId = pickedStockId
    }
    
    if let containerTypeStringValue = json["containerType"].string {
        if let containerType = StockContainerType(rawValue: containerTypeStringValue) {
            self.containerType = containerType
        }
    }
    
    if let containerId = json["containerId"].string {
        self.containerId = containerId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let sourcedStockId = self.sourcedStockId {
        dictionary["sourcedStockId"] = sourcedStockId
    }
    
    if let pickedStockId = self.pickedStockId {
        dictionary["pickedStockId"] = pickedStockId
    }
    
    if let containerType = self.containerType {
        dictionary["containerType"] = containerType.rawValue
    }
    
    if let containerId = self.containerId {
        dictionary["containerId"] = containerId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case PICK_REQUIRED
    case SCANNED_ITEM_REQUIRED
    case INVALID_PICK
    case INVALID_SCANNED_ITEM
    case NO_PICKED_STOCK
    case SCANNED_STOCK_NOT_FOUND
    case FAILED_TO_APPLY
    case MULTIPLE_CONTAINERS
    case NOT_ABLE_TO_APPLY
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSwapStockForPick.Code?
    var picks: [WsSwapStockForPick.Pick]?
    var possibleContainers: [Container]?

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
        if let code = WsSwapStockForPick.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let picksArrayValue = json["picks"].array {
        self.picks = []
        for item in picksArrayValue {
            if let value = WsSwapStockForPick.Pick(json: item), var picks = picks {
                picks.append(value)
            }
        }
    }
    
    if let possibleContainersArrayValue = json["possibleContainers"].array {
        self.possibleContainers = []
        for item in possibleContainersArrayValue {
            if let value = Container(json: item), var possibleContainers = possibleContainers {
                possibleContainers.append(value)
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
