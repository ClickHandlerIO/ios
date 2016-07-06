import Foundation
import SwiftyJSON

class User: JSONSerializable {
    var entity: UserEntity?
    var contactEntity: ContactEntity?
    var systemAdminEntity: SystemAdminEntity?
    var aeEntity: AeEntity?
    var hcpEntity: HcpEntity?
    var hcrEntity: HcrEntity?
    var dceEntity: DceEntity?
    var consumerEntity: ConsumerEntity?
    var orgInfo: OrgInfo?
    var colleagueIds: [String]?
    var teamIds: [String]?

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
    
    self.entity = UserEntity(json: json["entity"])
    
    self.contactEntity = ContactEntity(json: json["contactEntity"])
    
    self.systemAdminEntity = SystemAdminEntity(json: json["systemAdminEntity"])
    
    self.aeEntity = AeEntity(json: json["aeEntity"])
    
    self.hcpEntity = HcpEntity(json: json["hcpEntity"])
    
    self.hcrEntity = HcrEntity(json: json["hcrEntity"])
    
    self.dceEntity = DceEntity(json: json["dceEntity"])
    
    self.consumerEntity = ConsumerEntity(json: json["consumerEntity"])
    
    self.orgInfo = OrgInfo(json: json["orgInfo"])
    
    if let colleagueIdsArrayValue = json["colleagueIds"].array {
        self.colleagueIds = []
        for item in colleagueIdsArrayValue {
            if var colleagueIds = colleagueIds {
                colleagueIds.append(item.stringValue)
            }
        }
    }
    
    if let teamIdsArrayValue = json["teamIds"].array {
        self.teamIds = []
        for item in teamIdsArrayValue {
            if var teamIds = teamIds {
                teamIds.append(item.stringValue)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let entity = self.entity {
        dictionary["entity"] = entity.asDictionary()
    }
    
    if let contactEntity = self.contactEntity {
        dictionary["contactEntity"] = contactEntity.asDictionary()
    }
    
    if let systemAdminEntity = self.systemAdminEntity {
        dictionary["systemAdminEntity"] = systemAdminEntity.asDictionary()
    }
    
    if let aeEntity = self.aeEntity {
        dictionary["aeEntity"] = aeEntity.asDictionary()
    }
    
    if let hcpEntity = self.hcpEntity {
        dictionary["hcpEntity"] = hcpEntity.asDictionary()
    }
    
    if let hcrEntity = self.hcrEntity {
        dictionary["hcrEntity"] = hcrEntity.asDictionary()
    }
    
    if let dceEntity = self.dceEntity {
        dictionary["dceEntity"] = dceEntity.asDictionary()
    }
    
    if let consumerEntity = self.consumerEntity {
        dictionary["consumerEntity"] = consumerEntity.asDictionary()
    }
    
    if let orgInfo = self.orgInfo {
        dictionary["orgInfo"] = orgInfo.asDictionary()
    }
    
    return dictionary
}
}
