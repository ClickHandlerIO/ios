import Foundation
import SwiftyJSON

struct WsGetCycleCount {

    class Request: WsRequest {
        typealias Response = WsGetCycleCount.Response
        
        var cycleCountId: String?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/getcyclecount"
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
            
            if let cycleCountId = json["cycleCountId"].string {
                self.cycleCountId = cycleCountId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let cycleCountId = self.cycleCountId {
                dictionary["cycleCountId"] = cycleCountId
            }
            
            return dictionary
        }
    }

class CycleCountDetail: JSONSerializable {
    var id: String?
    var number: Int?
    var status: CycleCountStatus?
    var location: Location?
    var containersToBeCounted: [Container]?
    var itemsToBeCounted: [ItemEntity]?

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
    
    if let number = json["number"].int {
        self.number = number
    }
    
    if let statusStringValue = json["status"].string {
        if let status = CycleCountStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
    
    self.location = Location(json: json["location"])
    
    if let containersToBeCountedArrayValue = json["containersToBeCounted"].array {
        self.containersToBeCounted = []
        for item in containersToBeCountedArrayValue {
            if let value = Container(json: item), var containersToBeCounted = containersToBeCounted {
                containersToBeCounted.append(value)
            }
        }
    }
    
    if let itemsToBeCountedArrayValue = json["itemsToBeCounted"].array {
        self.itemsToBeCounted = []
        for item in itemsToBeCountedArrayValue {
            if let value = ItemEntity(json: item), var itemsToBeCounted = itemsToBeCounted {
                itemsToBeCounted.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let number = self.number {
        dictionary["number"] = number
    }
    
    if let status = self.status {
        dictionary["status"] = status.rawValue
    }
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case CYCLE_COUNT_ID_REQUIRED
    case CYCLE_COUNT_NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsGetCycleCount.Code?
    var detail: WsGetCycleCount.CycleCountDetail?

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
        if let code = WsGetCycleCount.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.detail = WsGetCycleCount.CycleCountDetail(json: json["detail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let detail = self.detail {
        dictionary["detail"] = detail.asDictionary()
    }
    
    return dictionary
}
}

}
