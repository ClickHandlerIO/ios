import Foundation
import SwiftyJSON

struct WsListOuLinkedTeams {

    class Request: WsRequest {
        typealias Response = WsListOuLinkedTeams.Response
        
        var orgUnitId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/teamtoorgunit/listoulinkedteams"
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

class Response: JSONSerializable {
    var code: WsListOuLinkedTeams.Code?
    var teamRelations: [WsListOuLinkedTeams.TeamRelation]?

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
        if let code = WsListOuLinkedTeams.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let teamRelationsArrayValue = json["teamRelations"].array {
        self.teamRelations = []
        for item in teamRelationsArrayValue {
            if let value = WsListOuLinkedTeams.TeamRelation(json: item), var teamRelations = teamRelations {
                teamRelations.append(value)
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

class TeamRelation: JSONSerializable {
    var id: String?
    var teamId: String?
    var name: String?
    var salesTeam: Bool?
    var opsTeam: Bool?
    var active: Bool?

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
    
    if let teamId = json["teamId"].string {
        self.teamId = teamId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
    
    if let salesTeam = json["salesTeam"].bool {
        self.salesTeam = salesTeam
    }
    
    if let opsTeam = json["opsTeam"].bool {
        self.opsTeam = opsTeam
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let teamId = self.teamId {
        dictionary["teamId"] = teamId
    }
    
    if let name = self.name {
        dictionary["name"] = name
    }
    
    if let salesTeam = self.salesTeam {
        dictionary["salesTeam"] = salesTeam
    }
    
    if let opsTeam = self.opsTeam {
        dictionary["opsTeam"] = opsTeam
    }
    
    if let active = self.active {
        dictionary["active"] = active
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

}
