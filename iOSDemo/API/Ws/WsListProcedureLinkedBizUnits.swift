import Foundation
import SwiftyJSON

struct WsListProcedureLinkedBizUnits {

    class Request: WsRequest {
        typealias Response = WsListProcedureLinkedBizUnits.Response
        
        var procedureId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/proceduretobizunit/listprocedurelinkedbizunits"
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
            
            if let procedureId = json["procedureId"].string {
                self.procedureId = procedureId
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let procedureId = self.procedureId {
                dictionary["procedureId"] = procedureId
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
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListProcedureLinkedBizUnits.Code?
    var bizUnitRelations: [BizUnitRelation]?

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
        if let code = WsListProcedureLinkedBizUnits.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let bizUnitRelationsArrayValue = json["bizUnitRelations"].array {
        self.bizUnitRelations = []
        for item in bizUnitRelationsArrayValue {
            if let value = BizUnitRelation(json: item), var bizUnitRelations = bizUnitRelations {
                bizUnitRelations.append(value)
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
    case PROCEDURE_ID_REQUIRED
    case FAILED
}

}
