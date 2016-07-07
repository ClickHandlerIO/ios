import Foundation
import SwiftyJSON

struct WsListSurgeonPhysiciansForSearch {

    class Request: WsRequest {
        typealias Response = WsListSurgeonPhysiciansForSearch.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/event/search/listsurgeonphysiciansforsearch"
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
    var code: WsListSurgeonPhysiciansForSearch.Code?
    var surgeons: [PhysicianEntity]?

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
        if let code = WsListSurgeonPhysiciansForSearch.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let surgeonsArrayValue = json["surgeons"].array {
        self.surgeons = []
        for item in surgeonsArrayValue {
            if let value = PhysicianEntity(json: item), var surgeons = surgeons {
                surgeons.append(value)
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
    case NOT_IMPLEMENTED
    case FAILED
}

}
