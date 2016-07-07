import Foundation
import SwiftyJSON

struct WsListOuTeamOptions {

    class Request: WsRequest {
        typealias Response = WsListOuTeamOptions.Response
        
        var orgUnitId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/teamtoorgunit/listouteamoptions"
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
            
            if let pageSize = self.pageSize {
                dictionary["pageSize"] = pageSize
            }
            
            if let lastRecordId = self.lastRecordId {
                dictionary["lastRecordId"] = lastRecordId
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case ORG_UNIT_ID_REQUIRED
    case NOT_IMPLEMENTED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListOuTeamOptions.Code?
    var teamOptions: [TeamOption]?

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
        if let code = WsListOuTeamOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let teamOptionsArrayValue = json["teamOptions"].array {
        self.teamOptions = []
        for item in teamOptionsArrayValue {
            if let value = TeamOption(json: item), var teamOptions = teamOptions {
                teamOptions.append(value)
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
