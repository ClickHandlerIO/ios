import Foundation
import SwiftyJSON

struct WsGetInfoForPackageVerify {

    class Request: WsRequest {
        typealias Response = WsGetInfoForPackageVerify.Response
        
        var packageId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/getinfoforpackageverify"
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
            
            if let packageId = json["packageId"].string {
                self.packageId = packageId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let packageId = self.packageId {
                dictionary["packageId"] = packageId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetInfoForPackageVerify.Code?
    var order: OrderHeaderEntity?
    var packageEntity: PackageEntity?
    var otherShipmentPackages: [PackageEntity]?
    var shipment: ShipmentEntity?
    var caseEvent: CaseEventEntity?
    var loan: LoanEntity?
    var stockEntities: [StockEntity]?
    var items: [WsGetInfoForPackageVerify.Item]?
    var barcodes: [BarcodeEntity]?
    var lots: [LotEntity]?
    var serials: [SerialEntity]?

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
        if let code = WsGetInfoForPackageVerify.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.order = OrderHeaderEntity(json: json["order"])
    
    self.packageEntity = PackageEntity(json: json["packageEntity"])
    
    if let otherShipmentPackagesArrayValue = json["otherShipmentPackages"].array {
        self.otherShipmentPackages = []
        for item in otherShipmentPackagesArrayValue {
            if let value = PackageEntity(json: item), var otherShipmentPackages = otherShipmentPackages {
                otherShipmentPackages.append(value)
            }
        }
    }
    
    self.shipment = ShipmentEntity(json: json["shipment"])
    
    self.caseEvent = CaseEventEntity(json: json["caseEvent"])
    
    self.loan = LoanEntity(json: json["loan"])
    
    if let stockEntitiesArrayValue = json["stockEntities"].array {
        self.stockEntities = []
        for item in stockEntitiesArrayValue {
            if let value = StockEntity(json: item), var stockEntities = stockEntities {
                stockEntities.append(value)
            }
        }
    }
    
    if let itemsArrayValue = json["items"].array {
        self.items = []
        for item in itemsArrayValue {
            if let value = WsGetInfoForPackageVerify.Item(json: item), var items = items {
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
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let order = self.order {
        dictionary["order"] = order.asDictionary()
    }
    
    if let packageEntity = self.packageEntity {
        dictionary["packageEntity"] = packageEntity.asDictionary()
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

enum Code: String {
    case SUCCESS
    case PACKAGE_ID_REQUIRED
    case FAILED
    case SHIPMENT_NOT_FOUND
    case ORDER_NOT_FOUND
    case LOAN_NOT_FOUND
    case PACKAGE_NOT_FOUND
    case PACKAGE_NOT_READY_FOR_VERIFY
    case STATE_CHANGE_FAILED
    case NOT_IMPLEMENTED
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

}
