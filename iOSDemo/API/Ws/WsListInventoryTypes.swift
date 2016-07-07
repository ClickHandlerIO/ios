import Foundation
import SwiftyJSON

struct WsListInventoryTypes {

    class Request: WsRequest {
        typealias Response = WsListInventoryTypes.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/listinventorytypes"
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
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListInventoryTypes.Code?
    var inventoryTypes: [InventoryTypeEntity]?

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
        if let code = WsListInventoryTypes.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let inventoryTypesArrayValue = json["inventoryTypes"].array {
        self.inventoryTypes = []
        for item in inventoryTypesArrayValue {
            if let value = InventoryTypeEntity(json: item), var inventoryTypes = inventoryTypes {
                inventoryTypes.append(value)
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

enum Code: String {
    case SUCCESS
    case BIZ_UNIT_ID_REQUIRED
    case CASE_NOT_FOUND
    case CONTEXT_REQUIRED
    case FAILED
}

}
