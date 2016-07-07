import Foundation
import SwiftyJSON

struct WsListHospitalsForSearch {

    class Request: WsRequest {
        typealias Response = WsListHospitalsForSearch.Response
        
        var search: String?
        
        class func getPath() -> String {
            return "/event/search/surgery/listhospitalsforsearch"
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
            
            if let search = json["search"].string {
                self.search = search
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsListHospitalsForSearch.Code?
    var hospitals: [FacilityEntity]?

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
        if let code = WsListHospitalsForSearch.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let hospitalsArrayValue = json["hospitals"].array {
        self.hospitals = []
        for item in hospitalsArrayValue {
            if let value = FacilityEntity(json: item), var hospitals = hospitals {
                hospitals.append(value)
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
    case NOT_IMPLEMENTED
    case FAILED
}

}
