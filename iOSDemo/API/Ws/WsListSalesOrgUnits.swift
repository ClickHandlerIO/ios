import Foundation
import SwiftyJSON

struct WsListSalesOrgUnits {

    class Request: WsRequest {
        typealias Response = WsListSalesOrgUnits.Response
        
        var search: String?
        var opOuIds: [String]?
        
        class func getPath() -> String {
            return "/dir/orgunit/listsalesorgunits"
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
            
            if let opOuIdsArrayValue = json["opOuIds"].array {
                self.opOuIds = []
                for item in opOuIdsArrayValue {
                    if var opOuIds = opOuIds, let itemValue = item.string {
                        opOuIds.append(itemValue)
                    }
                }
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
    var code: WsListSalesOrgUnits.Code?
    var entities: [OrgUnitEntity]?

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
        if let code = WsListSalesOrgUnits.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let entitiesArrayValue = json["entities"].array {
        self.entities = []
        for item in entitiesArrayValue {
            if let value = OrgUnitEntity(json: item), var entities = entities {
                entities.append(value)
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
    case FAILED
    case INVALID_ORG_ID
}

}
