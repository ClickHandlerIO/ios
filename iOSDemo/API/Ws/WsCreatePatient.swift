import Foundation
import SwiftyJSON

struct WsCreatePatient {

    class Request: WsRequest {
        typealias Response = WsCreatePatient.Response
        
        var healthSystemId: String?
        var userId: String?
        var ssn: String?
        var mrn: String?
        var name: PersonName?
        var dateOfBirth: Int?
        var active: Bool?
        var type_: PatientType?
        var gender: Gender?
        
        class func getPath() -> String {
            return "/dir/people/patient/create"
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
            
            if let healthSystemId = json["healthSystemId"].string {
                self.healthSystemId = healthSystemId
            }
            
            if let userId = json["userId"].string {
                self.userId = userId
            }
            
            if let ssn = json["ssn"].string {
                self.ssn = ssn
            }
            
            if let mrn = json["mrn"].string {
                self.mrn = mrn
            }
            
            self.name = PersonName(json: json["name"])
            
            if let active = json["active"].bool {
                self.active = active
            }
            
            if let type_StringValue = json["type"].string {
                if let type_ = PatientType(rawValue: type_StringValue) {
                    self.type_ = type_
                }
            }
            
            if let genderStringValue = json["gender"].string {
                if let gender = Gender(rawValue: genderStringValue) {
                    self.gender = gender
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let healthSystemId = self.healthSystemId {
                dictionary["healthSystemId"] = healthSystemId
            }
            
            if let userId = self.userId {
                dictionary["userId"] = userId
            }
            
            if let ssn = self.ssn {
                dictionary["ssn"] = ssn
            }
            
            if let mrn = self.mrn {
                dictionary["mrn"] = mrn
            }
            
            if let name = self.name {
                dictionary["name"] = name.asDictionary()
            }
            
            if let active = self.active {
                dictionary["active"] = active
            }
            
            if let type_ = self.type_ {
                dictionary["type"] = type_.rawValue
            }
            
            if let gender = self.gender {
                dictionary["gender"] = gender.rawValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NAME_REQUIRED
    case MRN_REQUIRED
    case DATE_OF_BIRTH_REQUIRED
    case PATIENT_TYPE_REQUIRED
    case HEALTH_SYSTEM_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCreatePatient.Code?
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
        if let code = WsCreatePatient.Code(rawValue: codeStringValue) {
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

}
