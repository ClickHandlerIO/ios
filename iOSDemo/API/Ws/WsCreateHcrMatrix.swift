import Foundation
import SwiftyJSON

struct WsCreateHcrMatrix {

    class Request: WsRequest {
        typealias Response = WsCreateHcrMatrix.Response
        
        var matrixEntries: [WsCreateHcrMatrix.MatrixEntry]?
        var hcrId: String?
        var teamId: String?
        
        class func getPath() -> String {
            return "/dir/hcrteammatrix/create"
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
            
            if let matrixEntriesArrayValue = json["matrixEntries"].array {
                self.matrixEntries = []
                for item in matrixEntriesArrayValue {
                    if let value = WsCreateHcrMatrix.MatrixEntry(json: item), var matrixEntries = matrixEntries {
                        matrixEntries.append(value)
                    }
                }
            }
            
            if let hcrId = json["hcrId"].string {
                self.hcrId = hcrId
            }
            
            if let teamId = json["teamId"].string {
                self.teamId = teamId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let hcrId = self.hcrId {
                dictionary["hcrId"] = hcrId
            }
            
            if let teamId = self.teamId {
                dictionary["teamId"] = teamId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreateHcrMatrix.Code?

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
        if let code = WsCreateHcrMatrix.Code(rawValue: codeStringValue) {
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

class MatrixEntry: JSONSerializable {
    var facilityId: String?
    var allFacilities: Bool?
    var physicianId: String?
    var allPhysicians: Bool?
    var procedureId: String?
    var allProcedures: Bool?

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
    
    if let facilityId = json["facilityId"].string {
        self.facilityId = facilityId
    }
    
    if let allFacilities = json["allFacilities"].bool {
        self.allFacilities = allFacilities
    }
    
    if let physicianId = json["physicianId"].string {
        self.physicianId = physicianId
    }
    
    if let allPhysicians = json["allPhysicians"].bool {
        self.allPhysicians = allPhysicians
    }
    
    if let procedureId = json["procedureId"].string {
        self.procedureId = procedureId
    }
    
    if let allProcedures = json["allProcedures"].bool {
        self.allProcedures = allProcedures
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let facilityId = self.facilityId {
        dictionary["facilityId"] = facilityId
    }
    
    if let allFacilities = self.allFacilities {
        dictionary["allFacilities"] = allFacilities
    }
    
    if let physicianId = self.physicianId {
        dictionary["physicianId"] = physicianId
    }
    
    if let allPhysicians = self.allPhysicians {
        dictionary["allPhysicians"] = allPhysicians
    }
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    if let allProcedures = self.allProcedures {
        dictionary["allProcedures"] = allProcedures
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case HCR_OR_TEAM_ID_REQUIRED
    case HCR_AND_TEAM_SET
    case ENTRY_REQUIRED
    case INVALID_ENTRY
    case FAILED
}

}
