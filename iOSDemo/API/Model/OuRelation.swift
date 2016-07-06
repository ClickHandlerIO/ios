import Foundation
import SwiftyJSON

class OuRelation: JSONSerializable {
    var id: String?
    var ouId: String?
    var ouName: String?
    var salesOrgUnit: Bool?
    var opsOrgUnit: Bool?
    var ouLabel: String?
    var ouActive: Bool?

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
    
    if let ouId = json["ouId"].string {
        self.ouId = ouId
    }
    
    if let ouName = json["ouName"].string {
        self.ouName = ouName
    }
    
    if let salesOrgUnit = json["salesOrgUnit"].bool {
        self.salesOrgUnit = salesOrgUnit
    }
    
    if let opsOrgUnit = json["opsOrgUnit"].bool {
        self.opsOrgUnit = opsOrgUnit
    }
    
    if let ouLabel = json["ouLabel"].string {
        self.ouLabel = ouLabel
    }
    
    if let ouActive = json["ouActive"].bool {
        self.ouActive = ouActive
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let ouId = self.ouId {
        dictionary["ouId"] = ouId
    }
    
    if let ouName = self.ouName {
        dictionary["ouName"] = ouName
    }
    
    if let salesOrgUnit = self.salesOrgUnit {
        dictionary["salesOrgUnit"] = salesOrgUnit
    }
    
    if let opsOrgUnit = self.opsOrgUnit {
        dictionary["opsOrgUnit"] = opsOrgUnit
    }
    
    if let ouLabel = self.ouLabel {
        dictionary["ouLabel"] = ouLabel
    }
    
    if let ouActive = self.ouActive {
        dictionary["ouActive"] = ouActive
    }
    
    return dictionary
}
}
