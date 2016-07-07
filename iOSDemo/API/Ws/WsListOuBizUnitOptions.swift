import Foundation
import SwiftyJSON

struct WsListOuBizUnitOptions {

    class Request: WsRequest {
        typealias Response = WsListOuBizUnitOptions.Response
        
        var orgUnitId: String?
        var search: String?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/bizunittoorgunit/listoubizunitoptions"
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
            
            if let orgUnitId = json["orgUnitId"].string {
                self.orgUnitId = orgUnitId
            }
            
            if let search = json["search"].string {
                self.search = search
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
            
            if let orgUnitId = self.orgUnitId {
                dictionary["orgUnitId"] = orgUnitId
            }
            
            if let search = self.search {
                dictionary["search"] = search
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
    case ORG_UNIT_ID_REQUIRED
    case OU_NOT_FOUND
    case OU_NOT_ROOT
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListOuBizUnitOptions.Code?
    var bizUnitOptions: [BizUnitOption]?

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
        if let code = WsListOuBizUnitOptions.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let bizUnitOptionsArrayValue = json["bizUnitOptions"].array {
        self.bizUnitOptions = []
        for item in bizUnitOptionsArrayValue {
            if let value = BizUnitOption(json: item), var bizUnitOptions = bizUnitOptions {
                bizUnitOptions.append(value)
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
