import Foundation
import SwiftyJSON

struct WsListHcrTeamForSearch {

    class Request: WsRequest {
        typealias Response = WsListHcrTeamForSearch.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/event/search/surgery/listhcrteamforsearch"
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

enum Code: String {
    case SUCCESS
    case NOT_IMPLEMENTED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListHcrTeamForSearch.Code?
    var hcrTeams: [HcrTeam]?

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
        if let code = WsListHcrTeamForSearch.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let hcrTeamsArrayValue = json["hcrTeams"].array {
        self.hcrTeams = []
        for item in hcrTeamsArrayValue {
            if let value = HcrTeam(json: item), var hcrTeams = hcrTeams {
                hcrTeams.append(value)
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
