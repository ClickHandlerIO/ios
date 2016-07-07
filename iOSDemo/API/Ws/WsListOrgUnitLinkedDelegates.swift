import Foundation
import SwiftyJSON

struct WsListOrgUnitLinkedDelegates {

    class Request: WsRequest {
        typealias Response = WsListOrgUnitLinkedDelegates.Response
        
        var orgUnitId: String?
        var search: String?
        var sortBy: WsListOrgUnitLinkedDelegates.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/delegate/listoulinked"
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
            
            if let orgUnitId = json["orgUnitId"].string {
                self.orgUnitId = orgUnitId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListOrgUnitLinkedDelegates.SortBy(rawValue: sortByStringValue) {
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
            
            if let orgUnitId = self.orgUnitId {
                dictionary["orgUnitId"] = orgUnitId
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

enum SortBy: String {
    case NAME
    case TYPE
}

enum Code: String {
    case SUCCESS
    case ORG_UNIT_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListOrgUnitLinkedDelegates.Code?
    var delegateRelations: [DelegateRelation]?

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
        if let code = WsListOrgUnitLinkedDelegates.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let delegateRelationsArrayValue = json["delegateRelations"].array {
        self.delegateRelations = []
        for item in delegateRelationsArrayValue {
            if let value = DelegateRelation(json: item), var delegateRelations = delegateRelations {
                delegateRelations.append(value)
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
