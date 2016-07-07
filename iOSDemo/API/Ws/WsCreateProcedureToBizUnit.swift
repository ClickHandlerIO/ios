import Foundation
import SwiftyJSON

struct WsCreateProcedureToBizUnit {

    class Request: WsRequest {
        typealias Response = WsCreateProcedureToBizUnit.Response
        
        var procedureIds: [String]?
        var bizUnitIds: [String]?
        
        class func getPath() -> String {
            return "/dir/proceduretobizunit/create"
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
            
            if let procedureIdsArrayValue = json["procedureIds"].array {
                self.procedureIds = []
                for item in procedureIdsArrayValue {
                    if var procedureIds = procedureIds, let itemValue = item.string {
                        procedureIds.append(itemValue)
                    }
                }
            }
            
            if let bizUnitIdsArrayValue = json["bizUnitIds"].array {
                self.bizUnitIds = []
                for item in bizUnitIdsArrayValue {
                    if var bizUnitIds = bizUnitIds, let itemValue = item.string {
                        bizUnitIds.append(itemValue)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_REQUEST
    case PROCEDURE_AND_BIZ_UNIT_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreateProcedureToBizUnit.Code?

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
        if let code = WsCreateProcedureToBizUnit.Code(rawValue: codeStringValue) {
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

}
