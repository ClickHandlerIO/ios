import Foundation
import SwiftyJSON

struct WsGetPatient {

    class Request: WsRequest {
        typealias Response = WsGetPatient.Response
        
        var id: String?
        
        class func getPath() -> String {
            return "/dir/patient/get"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsGetPatient.Code?
    var entity: PatientEntity?

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
        if let code = WsGetPatient.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.entity = PatientEntity(json: json["entity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let entity = self.entity {
        dictionary["entity"] = entity.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case GET_FAILED
    case NOT_FOUND
    case FAILED
}

}
