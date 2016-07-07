import Foundation
import SwiftyJSON

struct WsListOrg {

    class Request: WsRequest {
        typealias Response = WsListOrg.Response
        
        var orgTypes: [OrgType]?
        var search: String?
        var includeInactiveRecords: Bool?
        var sortBy: WsListOrg.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/org/list"
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
            
            if let orgTypesArrayValue = json["orgTypes"].array {
                self.orgTypes = []
                for item in orgTypesArrayValue {
                    if let value = OrgType(rawValue: item.stringValue), var orgTypes = orgTypes {
                        orgTypes.append(value)
                    }
                }
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let includeInactiveRecords = json["includeInactiveRecords"].bool {
                self.includeInactiveRecords = includeInactiveRecords
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListOrg.SortBy(rawValue: sortByStringValue) {
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
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let includeInactiveRecords = self.includeInactiveRecords {
                dictionary["includeInactiveRecords"] = includeInactiveRecords
            }
            
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
    var code: WsListOrg.Code?
    var entities: [OrgEntity]?

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
        if let code = WsListOrg.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let entitiesArrayValue = json["entities"].array {
        self.entities = []
        for item in entitiesArrayValue {
            if let value = OrgEntity(json: item), var entities = entities {
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

enum Code: String {
    case SUCCESS
    case FAILED
}

enum SortBy: String {
    case NAME
    case TYPE
}

}
