import Foundation
import SwiftyJSON

struct WsListHcrLinkedOrgUnits {

    class Request: WsRequest {
        typealias Response = WsListHcrLinkedOrgUnits.Response
        
        var hcrId: String?
        var search: String?
        var sortBy: WsListHcrLinkedOrgUnits.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/relationship/hcrtoorgunit/listhcrlinkedous"
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
            
            if let hcrId = json["hcrId"].string {
                self.hcrId = hcrId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListHcrLinkedOrgUnits.SortBy(rawValue: sortByStringValue) {
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
            
            if let hcrId = self.hcrId {
                dictionary["hcrId"] = hcrId
            }
            
            if let search = self.search {
                dictionary["search"] = search
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

enum Code: String {
    case SUCCESS
    case HCR_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListHcrLinkedOrgUnits.Code?
    var ouRelations: [WsListHcrLinkedOrgUnits.HcrToOu]?

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
        if let code = WsListHcrLinkedOrgUnits.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let ouRelationsArrayValue = json["ouRelations"].array {
        self.ouRelations = []
        for item in ouRelationsArrayValue {
            if let value = WsListHcrLinkedOrgUnits.HcrToOu(json: item), var ouRelations = ouRelations {
                ouRelations.append(value)
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

class HcrToOu: JSONSerializable {
    var id: String?
    var hcrId: String?
    var orgUnitId: String?
    var orgUnitName: String?
    var description: String?
    var label: String?
    var active: Bool?

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
    
    if let hcrId = json["hcrId"].string {
        self.hcrId = hcrId
    }
    
    if let orgUnitId = json["orgUnitId"].string {
        self.orgUnitId = orgUnitId
    }
    
    if let orgUnitName = json["orgUnitName"].string {
        self.orgUnitName = orgUnitName
    }
    
    if let description = json["description"].string {
        self.description = description
    }
    
    if let label = json["label"].string {
        self.label = label
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let hcrId = self.hcrId {
        dictionary["hcrId"] = hcrId
    }
    
    if let orgUnitId = self.orgUnitId {
        dictionary["orgUnitId"] = orgUnitId
    }
    
    if let orgUnitName = self.orgUnitName {
        dictionary["orgUnitName"] = orgUnitName
    }
    
    if let description = self.description {
        dictionary["description"] = description
    }
    
    if let label = self.label {
        dictionary["label"] = label
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    return dictionary
}
}

enum SortBy: String {
    case NAME
    case LABEl
}

}
