import Foundation
import SwiftyJSON

struct WsListBizUnitProcedureOptions {

    class Request: WsRequest {
        typealias Response = WsListBizUnitProcedureOptions.Response
        
        var bizUnitId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/proceduretobizunit/listbuprocedureoptions"
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
            
            if let bizUnitId = json["bizUnitId"].string {
                self.bizUnitId = bizUnitId
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
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
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

class ProcedureOption: JSONSerializable {
    var procedureId: String?
    var procedureName: String?
    var procedureIcdCode: String?
    var procedureDescription: String?
    var procedureBodySideRequired: Bool?

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
    
    if let procedureName = json["procedureName"].string {
        self.procedureName = procedureName
    }
    
    if let procedureIcdCode = json["procedureIcdCode"].string {
        self.procedureIcdCode = procedureIcdCode
    }
    
    if let procedureDescription = json["procedureDescription"].string {
        self.procedureDescription = procedureDescription
    }
    
    if let procedureBodySideRequired = json["procedureBodySideRequired"].bool {
        self.procedureBodySideRequired = procedureBodySideRequired
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    if let procedureName = self.procedureName {
        dictionary["procedureName"] = procedureName
    }
    
    if let procedureIcdCode = self.procedureIcdCode {
        dictionary["procedureIcdCode"] = procedureIcdCode
    }
    
    if let procedureDescription = self.procedureDescription {
        dictionary["procedureDescription"] = procedureDescription
    }
    
    if let procedureBodySideRequired = self.procedureBodySideRequired {
        dictionary["procedureBodySideRequired"] = procedureBodySideRequired
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListBizUnitProcedureOptions.Code?
    var procedureOptions: [WsListBizUnitProcedureOptions.ProcedureOption]?

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
        if let code = WsListBizUnitProcedureOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let procedureOptionsArrayValue = json["procedureOptions"].array {
        self.procedureOptions = []
        for item in procedureOptionsArrayValue {
            if let value = WsListBizUnitProcedureOptions.ProcedureOption(json: item), var procedureOptions = procedureOptions {
                procedureOptions.append(value)
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
    case BIZ_UNIT_ID_REQUIRED
    case FAILED
}

}
