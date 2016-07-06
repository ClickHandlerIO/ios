import Foundation
import SwiftyJSON

class DelegateRelation: JSONSerializable {
    var id: String?
    var delegateId: String?
    var delegateType: PersonType?
    var delegateName: PersonName?
    var delegateEmail: Email?
    var delegateActive: Bool?

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
    
    if let delegateId = json["delegateId"].string {
        self.delegateId = delegateId
    }
    
    if let delegateTypeStringValue = json["delegateType"].string {
        if let delegateType = PersonType(rawValue: delegateTypeStringValue) {
            self.delegateType = delegateType
        }
    }
    
    self.delegateName = PersonName(json: json["delegateName"])
    
    self.delegateEmail = Email(json: json["delegateEmail"])
    
    if let delegateActive = json["delegateActive"].bool {
        self.delegateActive = delegateActive
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let delegateId = self.delegateId {
        dictionary["delegateId"] = delegateId
    }
    
    if let delegateType = self.delegateType {
        dictionary["delegateType"] = delegateType.rawValue
    }
    
    if let delegateName = self.delegateName {
        dictionary["delegateName"] = delegateName.asDictionary()
    }
    
    if let delegateEmail = self.delegateEmail {
        dictionary["delegateEmail"] = delegateEmail.asDictionary()
    }
    
    if let delegateActive = self.delegateActive {
        dictionary["delegateActive"] = delegateActive
    }
    
    return dictionary
}
}
