import Foundation
import SwiftyJSON

struct WsGetStock {

    class Request: WsRequest {
        typealias Response = WsGetStock.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/inventory/stock/getstock"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case STOCK_ID_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsGetStock.Code?
    var stockDetail: WsGetStock.StockDetail?

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
        if let code = WsGetStock.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.stockDetail = WsGetStock.StockDetail(json: json["stockDetail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let stockDetail = self.stockDetail {
        dictionary["stockDetail"] = stockDetail.asDictionary()
    }
    
    return dictionary
}
}

class StockDetail: JSONSerializable {
    var stockEntity: StockEntity?
    var bizUnitEntity: BizUnitEntity?
    var inventoryTypeEntity: InventoryTypeEntity?
    var itemEntity: ItemEntity?
    var itemVersionEntity: ItemVersionEntity?
    var lotEntity: LotEntity?
    var serialEntity: SerialEntity?
    var homeLocation: Location?
    var location: Location?
    var fromLocation: Location?
    var toLocation: Location?
    var dueBackToLocation: Location?
    var container: Container?
    var rootContainer: Container?

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
    
    self.stockEntity = StockEntity(json: json["stockEntity"])
    
    self.bizUnitEntity = BizUnitEntity(json: json["bizUnitEntity"])
    
    self.inventoryTypeEntity = InventoryTypeEntity(json: json["inventoryTypeEntity"])
    
    self.itemEntity = ItemEntity(json: json["itemEntity"])
    
    self.itemVersionEntity = ItemVersionEntity(json: json["itemVersionEntity"])
    
    self.lotEntity = LotEntity(json: json["lotEntity"])
    
    self.serialEntity = SerialEntity(json: json["serialEntity"])
    
    self.homeLocation = Location(json: json["homeLocation"])
    
    self.location = Location(json: json["location"])
    
    self.fromLocation = Location(json: json["fromLocation"])
    
    self.toLocation = Location(json: json["toLocation"])
    
    self.dueBackToLocation = Location(json: json["dueBackToLocation"])
    
    self.container = Container(json: json["container"])
    
    self.rootContainer = Container(json: json["rootContainer"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let stockEntity = self.stockEntity {
        dictionary["stockEntity"] = stockEntity.asDictionary()
    }
    
    if let bizUnitEntity = self.bizUnitEntity {
        dictionary["bizUnitEntity"] = bizUnitEntity.asDictionary()
    }
    
    if let inventoryTypeEntity = self.inventoryTypeEntity {
        dictionary["inventoryTypeEntity"] = inventoryTypeEntity.asDictionary()
    }
    
    if let itemEntity = self.itemEntity {
        dictionary["itemEntity"] = itemEntity.asDictionary()
    }
    
    if let itemVersionEntity = self.itemVersionEntity {
        dictionary["itemVersionEntity"] = itemVersionEntity.asDictionary()
    }
    
    if let lotEntity = self.lotEntity {
        dictionary["lotEntity"] = lotEntity.asDictionary()
    }
    
    if let serialEntity = self.serialEntity {
        dictionary["serialEntity"] = serialEntity.asDictionary()
    }
    
    if let homeLocation = self.homeLocation {
        dictionary["homeLocation"] = homeLocation.asDictionary()
    }
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    if let fromLocation = self.fromLocation {
        dictionary["fromLocation"] = fromLocation.asDictionary()
    }
    
    if let toLocation = self.toLocation {
        dictionary["toLocation"] = toLocation.asDictionary()
    }
    
    if let dueBackToLocation = self.dueBackToLocation {
        dictionary["dueBackToLocation"] = dueBackToLocation.asDictionary()
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
    }
    
    if let rootContainer = self.rootContainer {
        dictionary["rootContainer"] = rootContainer.asDictionary()
    }
    
    return dictionary
}
}

}
