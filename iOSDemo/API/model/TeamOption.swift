import Foundation
import SwiftyJSON

class TeamOption: JSONSerializable {
    var teamId: String?
    var teamName: String?
    var salesTeam: Bool?
    var opsTeam: Bool?

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
    
    if let teamId = json["teamId"].string {
        self.teamId = teamId
    }
    
    if let teamName = json["teamName"].string {
        self.teamName = teamName
    }
    
    if let salesTeam = json["salesTeam"].bool {
        self.salesTeam = salesTeam
    }
    
    if let opsTeam = json["opsTeam"].bool {
        self.opsTeam = opsTeam
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let teamId = self.teamId {
        dictionary["teamId"] = teamId
    }
    
    if let teamName = self.teamName {
        dictionary["teamName"] = teamName
    }
    
    if let salesTeam = self.salesTeam {
        dictionary["salesTeam"] = salesTeam
    }
    
    if let opsTeam = self.opsTeam {
        dictionary["opsTeam"] = opsTeam
    }
    
    return dictionary
}
}
