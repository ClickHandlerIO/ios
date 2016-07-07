import Foundation
import SwiftyJSON

struct WsListBins {

    class Request: WsRequest {
        typealias Response = WsListBins.Response
        
        var facilityId: String?
        var search: String?
        var sortBy: WsListBins.SortBy?
        var descending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/dir/bin/list"
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
            
            if let facilityId = json["facilityId"].string {
                self.facilityId = facilityId
            }
            
            if let search = json["search"].string {
                self.search = search
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListBins.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let descending = json["descending"].bool {
                self.descending = descending
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
            
            if let facilityId = self.facilityId {
                dictionary["facilityId"] = facilityId
            }
            
            if let search = self.search {
                dictionary["search"] = search
            }
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let descending = self.descending {
                dictionary["descending"] = descending
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
    case FACILITY_ID_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsListBins.Code?
    var bins: [BinDetail]?

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
        if let code = WsListBins.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let binsArrayValue = json["bins"].array {
        self.bins = []
        for item in binsArrayValue {
            if let value = BinDetail(json: item), var bins = bins {
                bins.append(value)
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

enum SortBy: String {
    case NAME
    case FACILITY_NAME
}

}
