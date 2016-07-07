import Foundation
import SwiftyJSON

struct WsUpdateCaseEventPatient {

    class Request: WsRequest {
        typealias Response = WsUpdateCaseEventPatient.Response
        
        var caseEventId: String?
        var ssn: String?
        var mrn: String?
        var name: PersonName?
        var dateOfBirth: Int?
        var gender: Gender?
        
        class func getPath() -> String {
            return "/event/detail/surgery/updatecaseeventpatient"
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
            
            if let caseEventId = json["caseEventId"].string {
                self.caseEventId = caseEventId
            }
            
            if let ssn = json["ssn"].string {
                self.ssn = ssn
            }
            
            if let mrn = json["mrn"].string {
                self.mrn = mrn
            }
            
            self.name = PersonName(json: json["name"])
            
            if let genderStringValue = json["gender"].string {
                if let gender = Gender(rawValue: genderStringValue) {
                    self.gender = gender
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let caseEventId = self.caseEventId {
                dictionary["caseEventId"] = caseEventId
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
            
            if let gender = self.gender {
                dictionary["gender"] = gender.rawValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case NAME_REQUIRED
    case DATE_OF_BIRTH_REQUIRED
    case CASE_EVENT_ID_REQUIRED
    case CASE_NOT_FOUND
    case PATIENT_NOT_FOUND
    case GENDER_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUpdateCaseEventPatient.Code?

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
        if let code = WsUpdateCaseEventPatient.Code(rawValue: codeStringValue) {
            self.code = code
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
