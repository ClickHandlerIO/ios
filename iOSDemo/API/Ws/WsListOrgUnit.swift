import Foundation
import SwiftyJSON

struct WsListOrgUnit {

    class Request: WsRequest {
        typealias Response = WsListOrgUnit.Response
        
        var bizUnitIds: [String]?
        var opsOuIds: [String]?
        var search: String?
        var includeInactiveRecords: Bool?
        var salesOnly: Bool?
        var opsOnly: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        var sortBy: WsListOrgUnit.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/dir/orgunit/list"
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
            
            if let bizUnitIdsArrayValue = json["bizUnitIds"].array {
                self.bizUnitIds = []
                for item in bizUnitIdsArrayValue {
                    if var bizUnitIds = bizUnitIds, let itemValue = item.string {
                        bizUnitIds.append(itemValue)
                    }
                }
            }
            
            if let opsOuIdsArrayValue = json["opsOuIds"].array {
                self.opsOuIds = []
                for item in opsOuIdsArrayValue {
                    if var opsOuIds = opsOuIds, let itemValue = item.string {
                        opsOuIds.append(itemValue)
                    }
                }
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let includeInactiveRecords = json["includeInactiveRecords"].bool {
                self.includeInactiveRecords = includeInactiveRecords
            }
            
            if let salesOnly = json["salesOnly"].bool {
                self.salesOnly = salesOnly
            }
            
            if let opsOnly = json["opsOnly"].bool {
                self.opsOnly = opsOnly
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListOrgUnit.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let includeInactiveRecords = self.includeInactiveRecords {
                dictionary["includeInactiveRecords"] = includeInactiveRecords
            }
            
            if let salesOnly = self.salesOnly {
                dictionary["salesOnly"] = salesOnly
            }
            
            if let opsOnly = self.opsOnly {
                dictionary["opsOnly"] = opsOnly
            }
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FAILED
}

enum SortBy: String {
    case NAME
    case PUBLIC_NAME
    case LABEL
}

class Response: JSONSerializable {
    var code: WsListOrgUnit.Code?
    var entities: [OrgUnitEntity]?

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
        if let code = WsListOrgUnit.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let entitiesArrayValue = json["entities"].array {
        self.entities = []
        for item in entitiesArrayValue {
            if let value = OrgUnitEntity(json: item), var entities = entities {
                entities.append(value)
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
