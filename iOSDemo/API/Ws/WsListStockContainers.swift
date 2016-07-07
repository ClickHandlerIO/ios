import Foundation
import SwiftyJSON

struct WsListStockContainers {

    class Request: WsRequest {
        typealias Response = WsListStockContainers.Response
        
        var locationId: String?
        var search: String?
        var containerTypes: [StockContainerType]?
        
        class func getPath() -> String {
            return "/inventory/containers/liststockcontainers"
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
            
            if let locationId = json["locationId"].string {
                self.locationId = locationId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let containerTypesArrayValue = json["containerTypes"].array {
                self.containerTypes = []
                for item in containerTypesArrayValue {
                    if let value = StockContainerType(rawValue: item.stringValue), var containerTypes = containerTypes {
                        containerTypes.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListStockContainers.Code?
    var containers: [Container]?

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
        if let code = WsListStockContainers.Code(rawValue: codeStringValue) {
            self.code = code
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
    case LOCATION_TYPE_REQUIRED
    case LOCATION_ID_REQUIRED
    case FAILED
}

}
