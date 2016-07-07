import Foundation
import SwiftyJSON

struct WsListProceduresForScheduling {

    class Request: WsRequest {
        typealias Response = WsListProceduresForScheduling.Response
        
        var bizUnitId: String?
        var search: String?
        
        class func getPath() -> String {
            return "/event/scheduling/surgery/listproceduresforscheduling"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let bizUnitId = self.bizUnitId {
                dictionary["bizUnitId"] = bizUnitId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case BIZ_UNIT_IT_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListProceduresForScheduling.Code?
    var procedures: [ProcedureEntity]?

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
        if let code = WsListProceduresForScheduling.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let proceduresArrayValue = json["procedures"].array {
        self.procedures = []
        for item in proceduresArrayValue {
            if let value = ProcedureEntity(json: item), var procedures = procedures {
                procedures.append(value)
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
