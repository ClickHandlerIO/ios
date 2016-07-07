import Foundation
import SwiftyJSON

struct WsListHcrLinkedColleagues {

    class Request: WsRequest {
        typealias Response = WsListHcrLinkedColleagues.Response
        
        var hcrId: String?
        var search: String?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/relationship/hcrtocolleague/listcolleagues"
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
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
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
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
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

class Response: JSONSerializable {
    var code: WsListHcrLinkedColleagues.Code?
    var colleagueRelations: [WsListHcrLinkedColleagues.HcrToColleague]?

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
        if let code = WsListHcrLinkedColleagues.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let colleagueRelationsArrayValue = json["colleagueRelations"].array {
        self.colleagueRelations = []
        for item in colleagueRelationsArrayValue {
            if let value = WsListHcrLinkedColleagues.HcrToColleague(json: item), var colleagueRelations = colleagueRelations {
                colleagueRelations.append(value)
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

class HcrToColleague: JSONSerializable {
    var id: String?
    var hcrId: String?
    var colleagueHcrType: HcrType?
    var colleagueName: PersonName?
    var colleagueEmail: Email?
    var colleagueWorkPhoneNumber: PhoneNumber?
    var colleagueMobilePhoneNumber: PhoneNumber?
    var colleagueFaxNumber: PhoneNumber?
    var colleagueActive: Bool?

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
    
    if let colleagueHcrTypeStringValue = json["colleagueHcrType"].string {
        if let colleagueHcrType = HcrType(rawValue: colleagueHcrTypeStringValue) {
            self.colleagueHcrType = colleagueHcrType
        }
    }
    
    self.colleagueName = PersonName(json: json["colleagueName"])
    
    self.colleagueEmail = Email(json: json["colleagueEmail"])
    
    self.colleagueWorkPhoneNumber = PhoneNumber(json: json["colleagueWorkPhoneNumber"])
    
    self.colleagueMobilePhoneNumber = PhoneNumber(json: json["colleagueMobilePhoneNumber"])
    
    self.colleagueFaxNumber = PhoneNumber(json: json["colleagueFaxNumber"])
    
    if let colleagueActive = json["colleagueActive"].bool {
        self.colleagueActive = colleagueActive
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
    
    if let colleagueHcrType = self.colleagueHcrType {
        dictionary["colleagueHcrType"] = colleagueHcrType.rawValue
    }
    
    if let colleagueName = self.colleagueName {
        dictionary["colleagueName"] = colleagueName.asDictionary()
    }
    
    if let colleagueEmail = self.colleagueEmail {
        dictionary["colleagueEmail"] = colleagueEmail.asDictionary()
    }
    
    if let colleagueWorkPhoneNumber = self.colleagueWorkPhoneNumber {
        dictionary["colleagueWorkPhoneNumber"] = colleagueWorkPhoneNumber.asDictionary()
    }
    
    if let colleagueMobilePhoneNumber = self.colleagueMobilePhoneNumber {
        dictionary["colleagueMobilePhoneNumber"] = colleagueMobilePhoneNumber.asDictionary()
    }
    
    if let colleagueFaxNumber = self.colleagueFaxNumber {
        dictionary["colleagueFaxNumber"] = colleagueFaxNumber.asDictionary()
    }
    
    if let colleagueActive = self.colleagueActive {
        dictionary["colleagueActive"] = colleagueActive
    }
    
    return dictionary
}
}

}
