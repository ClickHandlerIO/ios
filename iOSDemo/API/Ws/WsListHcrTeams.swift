import Foundation
import SwiftyJSON

struct WsListHcrTeams {

    class Request: WsRequest {
        typealias Response = WsListHcrTeams.Response
        
        var facilityIds: [String]?
        var physicianIds: [String]?
        var procedureIds: [String]?
        var bizUnitIds: [String]?
        var hcrIds: [String]?
        var teamIds: [String]?
        var search: String?
        var flattenTeams: Bool?
        
        class func getPath() -> String {
            return "/dir/hcr/listHcrTeams"
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
            
            if let facilityIdsArrayValue = json["facilityIds"].array {
                self.facilityIds = []
                for item in facilityIdsArrayValue {
                    if var facilityIds = facilityIds, let itemValue = item.string {
                        facilityIds.append(itemValue)
                    }
                }
            }
            
            if let physicianIdsArrayValue = json["physicianIds"].array {
                self.physicianIds = []
                for item in physicianIdsArrayValue {
                    if var physicianIds = physicianIds, let itemValue = item.string {
                        physicianIds.append(itemValue)
                    }
                }
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
            
            if let hcrIdsArrayValue = json["hcrIds"].array {
                self.hcrIds = []
                for item in hcrIdsArrayValue {
                    if var hcrIds = hcrIds, let itemValue = item.string {
                        hcrIds.append(itemValue)
                    }
                }
            }
            
            if let teamIdsArrayValue = json["teamIds"].array {
                self.teamIds = []
                for item in teamIdsArrayValue {
                    if var teamIds = teamIds, let itemValue = item.string {
                        teamIds.append(itemValue)
                    }
                }
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let flattenTeams = json["flattenTeams"].bool {
                self.flattenTeams = flattenTeams
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let flattenTeams = self.flattenTeams {
                dictionary["flattenTeams"] = flattenTeams
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListHcrTeams.Code?
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
        if let code = WsListHcrTeams.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case FAILED
}

}
