import Foundation
import SwiftyJSON

struct WsListPhysicians {

    class Request: WsRequest {
        typealias Response = WsListPhysicians.Response
        
        var bizUnitIds: [String]?
        var facilityIds: [String]?
        var procedureIds: [String]?
        var physicianTypes: [PhysicianType]?
        var search: String?
        
        class func getPath() -> String {
            return "/event/scheduling/listphysicians"
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
            
            if let bizUnitIdsArrayValue = json["bizUnitIds"].array {
                self.bizUnitIds = []
                for item in bizUnitIdsArrayValue {
                    if var bizUnitIds = bizUnitIds, let itemValue = item.string {
                        bizUnitIds.append(itemValue)
                    }
                }
            }
            
            if let facilityIdsArrayValue = json["facilityIds"].array {
                self.facilityIds = []
                for item in facilityIdsArrayValue {
                    if var facilityIds = facilityIds, let itemValue = item.string {
                        facilityIds.append(itemValue)
                    }
                }
            }
            
            if let procedureIdsArrayValue = json["procedureIds"].array {
                self.procedureIds = []
                for item in procedureIdsArrayValue {
                    if var procedureIds = procedureIds, let itemValue = item.string {
                        procedureIds.append(itemValue)
                    }
                }
            }
            
            if let physicianTypesArrayValue = json["physicianTypes"].array {
                self.physicianTypes = []
                for item in physicianTypesArrayValue {
                    if let value = PhysicianType(rawValue: item.stringValue), var physicianTypes = physicianTypes {
                        physicianTypes.append(value)
                    }
                }
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
    var code: WsListPhysicians.Code?
    var physicians: [PhysicianEntity]?

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
        if let code = WsListPhysicians.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let physiciansArrayValue = json["physicians"].array {
        self.physicians = []
        for item in physiciansArrayValue {
            if let value = PhysicianEntity(json: item), var physicians = physicians {
                physicians.append(value)
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
