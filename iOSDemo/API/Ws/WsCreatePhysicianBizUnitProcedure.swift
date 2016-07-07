import Foundation
import SwiftyJSON

struct WsCreatePhysicianBizUnitProcedure {

    class Request: WsRequest {
        typealias Response = WsCreatePhysicianBizUnitProcedure.Response
        
        var physicianId: String?
        var entries: [WsCreatePhysicianBizUnitProcedure.BizUnitProcedureEntry]?
        
        class func getPath() -> String {
            return "/dir/physicianbizunitprocedure/create"
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
            
            if let entriesArrayValue = json["entries"].array {
                self.entries = []
                for item in entriesArrayValue {
                    if let value = WsCreatePhysicianBizUnitProcedure.BizUnitProcedureEntry(json: item), var entries = entries {
                        entries.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let physicianId = self.physicianId {
                dictionary["physicianId"] = physicianId
            }
            
            return dictionary
        }
    }

class BizUnitProcedureEntry: JSONSerializable {
    var bizUnitId: String?
    var procedureId: String?

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
    
    if let procedureId = json["procedureId"].string {
        self.procedureId = procedureId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsCreatePhysicianBizUnitProcedure.Code?

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
        if let code = WsCreatePhysicianBizUnitProcedure.Code(rawValue: codeStringValue) {
            self.code = code
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
    case PHYSICIAN_ID_REQUIRED
    case ENTRY_REQUIRED
    case INVALID_ENTRY
    case FAILED
}

}
