import Foundation
import SwiftyJSON

struct WsListProceduresForSearch {

    class Request: WsRequest {
        typealias Response = WsListProceduresForSearch.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/event/search/surgery/listproceduresforsearch"
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
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListProceduresForSearch.Code?
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
        if let code = WsListProceduresForSearch.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case FAILED
}

}
