import Foundation
import SwiftyJSON

struct WsSaveBin {

    class Request: WsRequest {
        typealias Response = WsSaveBin.Response
        
        var id: String?
        var facilityId: String?
        var name: String?
        
        class func getPath() -> String {
            return "/dir/bin/save"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
            }
            
            if let name = json["name"].string {
                self.name = name
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
            }
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case FACILITY_ID_REQUIRED
    case NAME_REQUIRED
    case NAME_ALREADY_IN_USE
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveBin.Code?
    var binId: String?

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
        if let code = WsSaveBin.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let binId = json["binId"].string {
        self.binId = binId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let binId = self.binId {
        dictionary["binId"] = binId
    }
    
    return dictionary
}
}

}
