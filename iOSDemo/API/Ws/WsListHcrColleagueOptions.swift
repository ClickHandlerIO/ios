import Foundation
import SwiftyJSON

struct WsListHcrColleagueOptions {

    class Request: WsRequest {
        typealias Response = WsListHcrColleagueOptions.Response
        
        var hcrId: String?
        var search: String?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/relationship/hcrtocolleague/listoptions"
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

class ColleagueOption: JSONSerializable {
    var colleagueId: String?
    var colleagueHcrType: HcrType?
    var colleagueName: PersonName?
    var colleagueEmail: Email?

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
    
    if let colleagueId = json["colleagueId"].string {
        self.colleagueId = colleagueId
    }
    
    if let colleagueHcrTypeStringValue = json["colleagueHcrType"].string {
        if let colleagueHcrType = HcrType(rawValue: colleagueHcrTypeStringValue) {
            self.colleagueHcrType = colleagueHcrType
        }
    }
    
    self.colleagueName = PersonName(json: json["colleagueName"])
    
    self.colleagueEmail = Email(json: json["colleagueEmail"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let colleagueId = self.colleagueId {
        dictionary["colleagueId"] = colleagueId
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
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListHcrColleagueOptions.Code?
    var colleagueOptions: [WsListHcrColleagueOptions.ColleagueOption]?

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
        if let code = WsListHcrColleagueOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let colleagueOptionsArrayValue = json["colleagueOptions"].array {
        self.colleagueOptions = []
        for item in colleagueOptionsArrayValue {
            if let value = WsListHcrColleagueOptions.ColleagueOption(json: item), var colleagueOptions = colleagueOptions {
                colleagueOptions.append(value)
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
