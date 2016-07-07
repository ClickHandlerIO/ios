import Foundation
import SwiftyJSON

struct WsCreateCycleCount {

    class Request: WsRequest {
        typealias Response = WsCreateCycleCount.Response
        
        var locationType: LocationType?
        var locationId: String?
        var containersToBeCounted: [WsCreateCycleCount.ContainerToCount]?
        var itemsToBeCounted: [String]?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/createcyclecount"
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
            
            if let locationTypeStringValue = json["locationType"].string {
                if let locationType = LocationType(rawValue: locationTypeStringValue) {
                    self.locationType = locationType
                }
            }
            
            if let locationId = json["locationId"].string {
                self.locationId = locationId
            }
            
            if let containersToBeCountedArrayValue = json["containersToBeCounted"].array {
                self.containersToBeCounted = []
                for item in containersToBeCountedArrayValue {
                    if let value = WsCreateCycleCount.ContainerToCount(json: item), var containersToBeCounted = containersToBeCounted {
                        containersToBeCounted.append(value)
                    }
                }
            }
            
            if let itemsToBeCountedArrayValue = json["itemsToBeCounted"].array {
                self.itemsToBeCounted = []
                for item in itemsToBeCountedArrayValue {
                    if var itemsToBeCounted = itemsToBeCounted, let itemValue = item.string {
                        itemsToBeCounted.append(itemValue)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let locationType = self.locationType {
                dictionary["locationType"] = locationType.rawValue
            }
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateCycleCount.Code?
    var id: String?

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
        if let code = WsCreateCycleCount.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let id = json["id"].string {
        self.id = id
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    return dictionary
}
}

class ContainerToCount: JSONSerializable {
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
    case LOCATION_TYPE_REQUIRED
    case LOCATION_ID_REQUIRED
    case INVALID_CONTAINER
    case DUPLICATE_CONTAINER
    case FAILED
}

}
