import Foundation
import SwiftyJSON

struct WsListHcrLinkedTeams {

    class Request: WsRequest {
        typealias Response = WsListHcrLinkedTeams.Response
        
        var hcrId: String?
        var descending: Bool?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/hcrtoteam/listlinkedteams"
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
            
            if let hcrId = json["hcrId"].string {
                self.hcrId = hcrId
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
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
            
            if let hcrId = self.hcrId {
                dictionary["hcrId"] = hcrId
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
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
    case HCR_ID_REQUIRED
    case FAILED
}

class HcrToTeam: JSONSerializable {
    var id: String?
    var hcrId: String?
    var teamId: String?
    var teamName: String?
    var teamActive: String?

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
    
    if let hcrId = json["hcrId"].string {
        self.hcrId = hcrId
    }
    
    if let teamId = json["teamId"].string {
        self.teamId = teamId
    }
    
    if let teamName = json["teamName"].string {
        self.teamName = teamName
    }
    
    if let teamActive = json["teamActive"].string {
        self.teamActive = teamActive
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let hcrId = self.hcrId {
        dictionary["hcrId"] = hcrId
    }
    
    if let teamId = self.teamId {
        dictionary["teamId"] = teamId
    }
    
    if let teamName = self.teamName {
        dictionary["teamName"] = teamName
    }
    
    if let teamActive = self.teamActive {
        dictionary["teamActive"] = teamActive
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListHcrLinkedTeams.Code?
    var teamRelations: [WsListHcrLinkedTeams.HcrToTeam]?

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
        if let code = WsListHcrLinkedTeams.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let teamRelationsArrayValue = json["teamRelations"].array {
        self.teamRelations = []
        for item in teamRelationsArrayValue {
            if let value = WsListHcrLinkedTeams.HcrToTeam(json: item), var teamRelations = teamRelations {
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

}
