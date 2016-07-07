import Foundation
import SwiftyJSON

struct WsListHcrMatrix {

    class Request: WsRequest {
        typealias Response = WsListHcrMatrix.Response
        
        var hcrId: String?
        var teamId: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/hcrteammatrix/list"
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
            
            if let teamId = json["teamId"].string {
                self.teamId = teamId
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
            
            if let teamId = self.teamId {
                dictionary["teamId"] = teamId
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

class MatrixDetail: JSONSerializable {
    var id: String?
    var hcrId: String?
    var teamId: String?
    var facilityId: String?
    var facilityName: String?
    var allFacilities: Bool?
    var physicianId: String?
    var physicianName: String?
    var allPhysicians: Bool?
    var procedureId: String?
    var procedureName: String?
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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let hcrId = json["hcrId"].string {
        self.hcrId = hcrId
    }
    
    if let teamId = json["teamId"].string {
        self.teamId = teamId
    }
    
    if let facilityId = json["facilityId"].string {
        self.facilityId = facilityId
    }
    
    if let facilityName = json["facilityName"].string {
        self.facilityName = facilityName
    }
    
    if let allFacilities = json["allFacilities"].bool {
        self.allFacilities = allFacilities
    }
    
    if let physicianId = json["physicianId"].string {
        self.physicianId = physicianId
    }
    
    if let physicianName = json["physicianName"].string {
        self.physicianName = physicianName
    }
    
    if let allPhysicians = json["allPhysicians"].bool {
        self.allPhysicians = allPhysicians
    }
    
    if let procedureId = json["procedureId"].string {
        self.procedureId = procedureId
    }
    
    if let procedureName = json["procedureName"].string {
        self.procedureName = procedureName
    }
    
    if let allProcedures = json["allProcedures"].bool {
        self.allProcedures = allProcedures
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
    
    if let teamId = self.teamId {
        dictionary["teamId"] = teamId
    }
    
    if let facilityId = self.facilityId {
        dictionary["facilityId"] = facilityId
    }
    
    if let facilityName = self.facilityName {
        dictionary["facilityName"] = facilityName
    }
    
    if let allFacilities = self.allFacilities {
        dictionary["allFacilities"] = allFacilities
    }
    
    if let physicianId = self.physicianId {
        dictionary["physicianId"] = physicianId
    }
    
    if let physicianName = self.physicianName {
        dictionary["physicianName"] = physicianName
    }
    
    if let allPhysicians = self.allPhysicians {
        dictionary["allPhysicians"] = allPhysicians
    }
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    if let procedureName = self.procedureName {
        dictionary["procedureName"] = procedureName
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
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListHcrMatrix.Code?
    var matrixDetailLines: [WsListHcrMatrix.MatrixDetail]?

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
        if let code = WsListHcrMatrix.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let matrixDetailLinesArrayValue = json["matrixDetailLines"].array {
        self.matrixDetailLines = []
        for item in matrixDetailLinesArrayValue {
            if let value = WsListHcrMatrix.MatrixDetail(json: item), var matrixDetailLines = matrixDetailLines {
                matrixDetailLines.append(value)
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
