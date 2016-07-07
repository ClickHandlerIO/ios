import Foundation
import SwiftyJSON

struct WsGetPicksForShipment {

    class Request: WsRequest {
        typealias Response = WsGetPicksForShipment.Response
        
        var shipmentId: String?
        
        class func getPath() -> String {
            return "/inventory/pick/getforshipment"
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
            
            if let shipmentId = json["shipmentId"].string {
                self.shipmentId = shipmentId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let shipmentId = self.shipmentId {
                dictionary["shipmentId"] = shipmentId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetPicksForShipment.Code?
    var order: OrderHeaderEntity?
    var shipment: ShipmentEntity?
    var caseEvent: CaseEventEntity?
    var loan: LoanEntity?
    var picks: [WsGetPicksForShipment.ShipmentPick]?
    var items: [WsGetPicksForShipment.Item]?
    var barcodes: [BarcodeEntity]?
    var lots: [LotEntity]?
    var serials: [SerialEntity]?
    var containers: [Container]?
    var packages: [Container]?

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
        if let code = WsGetPicksForShipment.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.order = OrderHeaderEntity(json: json["order"])
    
    self.shipment = ShipmentEntity(json: json["shipment"])
    
    self.caseEvent = CaseEventEntity(json: json["caseEvent"])
    
    self.loan = LoanEntity(json: json["loan"])
    
    if let picksArrayValue = json["picks"].array {
        self.picks = []
        for item in picksArrayValue {
            if let value = WsGetPicksForShipment.ShipmentPick(json: item), var picks = picks {
                picks.append(value)
            }
        }
    }
    
    if let itemsArrayValue = json["items"].array {
        self.items = []
        for item in itemsArrayValue {
            if let value = WsGetPicksForShipment.Item(json: item), var items = items {
                items.append(value)
            }
        }
    }
    
    if let barcodesArrayValue = json["barcodes"].array {
        self.barcodes = []
        for item in barcodesArrayValue {
            if let value = BarcodeEntity(json: item), var barcodes = barcodes {
                barcodes.append(value)
            }
        }
    }
    
    if let lotsArrayValue = json["lots"].array {
        self.lots = []
        for item in lotsArrayValue {
            if let value = LotEntity(json: item), var lots = lots {
                lots.append(value)
            }
        }
    }
    
    if let serialsArrayValue = json["serials"].array {
        self.serials = []
        for item in serialsArrayValue {
            if let value = SerialEntity(json: item), var serials = serials {
                serials.append(value)
            }
        }
    }
    
    if let containersArrayValue = json["containers"].array {
        self.containers = []
        for item in containersArrayValue {
            if let value = Container(json: item), var containers = containers {
                containers.append(value)
            }
        }
    }
    
    if let packagesArrayValue = json["packages"].array {
        self.packages = []
        for item in packagesArrayValue {
            if let value = Container(json: item), var packages = packages {
                packages.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let order = self.order {
        dictionary["order"] = order.asDictionary()
    }
    
    if let shipment = self.shipment {
        dictionary["shipment"] = shipment.asDictionary()
    }
    
    if let caseEvent = self.caseEvent {
        dictionary["caseEvent"] = caseEvent.asDictionary()
    }
    
    if let loan = self.loan {
        dictionary["loan"] = loan.asDictionary()
    }
    
    return dictionary
}
}

class Item: JSONSerializable {
    var itemId: String?
    var itemVersionId: String?
    var itemNumber: String?
    var itemDescription: String?

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
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemDescription = json["itemDescription"].string {
        self.itemDescription = itemDescription
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
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemDescription = self.itemDescription {
        dictionary["itemDescription"] = itemDescription
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case SHIPMENT_ID_REQUIRED
    case FAILED
    case SHIPMENT_NOT_FOUND
    case ORDER_NOT_FOUND
    case LOAN_NOT_FOUND
    case NOT_IMPLEMENTED
}

class ShipmentPick: JSONSerializable {
    var pick: Pick?
    var stock: StockEntity?

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
    
    self.pick = Pick(json: json["pick"])
    
    self.stock = StockEntity(json: json["stock"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let pick = self.pick {
        dictionary["pick"] = pick.asDictionary()
    }
    
    if let stock = self.stock {
        dictionary["stock"] = stock.asDictionary()
    }
    
    return dictionary
}
}

}
