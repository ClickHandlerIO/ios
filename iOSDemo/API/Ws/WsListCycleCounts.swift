import Foundation
import SwiftyJSON

struct WsListCycleCounts {

    class Request: WsRequest {
        typealias Response = WsListCycleCounts.Response
        
        var locationIds: [String]?
        var statuses: [CycleCountStatus]?
        var sortBy: WsListCycleCounts.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/cyclecount/listcyclecounts"
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
            
            if let locationIdsArrayValue = json["locationIds"].array {
                self.locationIds = []
                for item in locationIdsArrayValue {
                    if var locationIds = locationIds, let itemValue = item.string {
                        locationIds.append(itemValue)
                    }
                }
            }
            
            if let statusesArrayValue = json["statuses"].array {
                self.statuses = []
                for item in statusesArrayValue {
                    if let value = CycleCountStatus(rawValue: item.stringValue), var statuses = statuses {
                        statuses.append(value)
                    }
                }
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListCycleCounts.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListCycleCounts.Code?
    var cycleCounts: [WsListCycleCounts.CycleCountLite]?

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
        if let code = WsListCycleCounts.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let cycleCountsArrayValue = json["cycleCounts"].array {
        self.cycleCounts = []
        for item in cycleCountsArrayValue {
            if let value = WsListCycleCounts.CycleCountLite(json: item), var cycleCounts = cycleCounts {
                cycleCounts.append(value)
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

enum SortBy: String {
    case NUMBER
    case LOCATION
    case STATUS
}

enum Code: String {
    case SUCCESS
    case CONTEXT_REQUIRED
    case FAILED
}

class CycleCountLite: JSONSerializable {
    var id: String?
    var countNumber: Int?
    var status: CycleCountStatus?
    var location: Location?

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
    
    if let countNumber = json["countNumber"].int {
        self.countNumber = countNumber
    }
    
    if let statusStringValue = json["status"].string {
        if let status = CycleCountStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
    
    self.location = Location(json: json["location"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let countNumber = self.countNumber {
        dictionary["countNumber"] = countNumber
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

}
