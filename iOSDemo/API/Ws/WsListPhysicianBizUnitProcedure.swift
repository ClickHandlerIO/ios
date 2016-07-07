import Foundation
import SwiftyJSON

struct WsListPhysicianBizUnitProcedure {

    class Request: WsRequest {
        typealias Response = WsListPhysicianBizUnitProcedure.Response
        
        var physicianId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        var sortBy: WsListPhysicianBizUnitProcedure.SortBy?
        var descending: Bool?
        
        class func getPath() -> String {
            return "/dir/physicianbizunitprocedure/list"
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
            
            if let physicianId = json["physicianId"].string {
                self.physicianId = physicianId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let pageSize = json["pageSize"].int {
                self.pageSize = pageSize
            }
            
            if let lastRecordId = json["lastRecordId"].string {
                self.lastRecordId = lastRecordId
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListPhysicianBizUnitProcedure.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let physicianId = self.physicianId {
                dictionary["physicianId"] = physicianId
            }
            
            if let search = self.search {
                dictionary["search"] = search
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
    case PHYSICIAN_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListPhysicianBizUnitProcedure.Code?
    var relations: [WsListPhysicianBizUnitProcedure.PhysicianBizUnitProcedureRelation]?

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
        if let code = WsListPhysicianBizUnitProcedure.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let relationsArrayValue = json["relations"].array {
        self.relations = []
        for item in relationsArrayValue {
            if let value = WsListPhysicianBizUnitProcedure.PhysicianBizUnitProcedureRelation(json: item), var relations = relations {
                relations.append(value)
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
    case BIZ_UNIT_NAME
    case PROCEDURE_NAME
    case PROCEDURE_ICD
}

class PhysicianBizUnitProcedureRelation: JSONSerializable {
    var id: String?
    var bizUnitId: String?
    var bizUnitName: String?
    var procedureId: String?
    var procedureName: String?
    var procedureIcdCode: String?

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
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let bizUnitName = json["bizUnitName"].string {
        self.bizUnitName = bizUnitName
    }
    
    if let procedureId = json["procedureId"].string {
        self.procedureId = procedureId
    }
    
    if let procedureName = json["procedureName"].string {
        self.procedureName = procedureName
    }
    
    if let procedureIcdCode = json["procedureIcdCode"].string {
        self.procedureIcdCode = procedureIcdCode
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let bizUnitName = self.bizUnitName {
        dictionary["bizUnitName"] = bizUnitName
    }
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    if let procedureName = self.procedureName {
        dictionary["procedureName"] = procedureName
    }
    
    if let procedureIcdCode = self.procedureIcdCode {
        dictionary["procedureIcdCode"] = procedureIcdCode
    }
    
    return dictionary
}
}

}
