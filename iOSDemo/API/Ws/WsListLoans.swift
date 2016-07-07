import Foundation
import SwiftyJSON

struct WsListLoans {

    class Request: WsRequest {
        typealias Response = WsListLoans.Response
        
        var locationIds: [String]?
        var loanStatuses: [LoanStatus]?
        var loanReasons: [LoanReason]?
        var locationTypes: [LocationType]?
        var serviceStartDateMin: Int?
        var serviceStartDateMax: Int?
        var serviceEndDateMin: Int?
        var serviceEndDateMax: Int?
        var expirationDateMin: Int?
        var expirationDateMax: Int?
        var sortBy: WsListLoans.SortBy?
        var sortDescending: Bool?
        var pageSize: Int?
        var lastRecordId: String?
        
        class func getPath() -> String {
            return "/inventory/loan/listloans"
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
            
            if let locationIdsArrayValue = json["locationIds"].array {
                self.locationIds = []
                for item in locationIdsArrayValue {
                    if var locationIds = locationIds, let itemValue = item.string {
                        locationIds.append(itemValue)
                    }
                }
            }
            
            if let loanStatusesArrayValue = json["loanStatuses"].array {
                self.loanStatuses = []
                for item in loanStatusesArrayValue {
                    if let value = LoanStatus(rawValue: item.stringValue), var loanStatuses = loanStatuses {
                        loanStatuses.append(value)
                    }
                }
            }
            
            if let loanReasonsArrayValue = json["loanReasons"].array {
                self.loanReasons = []
                for item in loanReasonsArrayValue {
                    if let value = LoanReason(rawValue: item.stringValue), var loanReasons = loanReasons {
                        loanReasons.append(value)
                    }
                }
            }
            
            if let locationTypesArrayValue = json["locationTypes"].array {
                self.locationTypes = []
                for item in locationTypesArrayValue {
                    if let value = LocationType(rawValue: item.stringValue), var locationTypes = locationTypes {
                        locationTypes.append(value)
                    }
                }
            }
            
            if let sortByStringValue = json["sortBy"].string {
                if let sortBy = WsListLoans.SortBy(rawValue: sortByStringValue) {
                    self.sortBy = sortBy
                }
            }
            
            if let sortDescending = json["sortDescending"].bool {
                self.sortDescending = sortDescending
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
            
            if let sortBy = self.sortBy {
                dictionary["sortBy"] = sortBy.rawValue
            }
            
            if let sortDescending = self.sortDescending {
                dictionary["sortDescending"] = sortDescending
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
    case FAILED
}

enum SortBy: String {
    case LOCATION_NAME
    case NUMBER
    case STATUS
    case REASON
    case ITEM_CLASS
    case SERVICE_START_DATE
    case SERVICE_END_DATE
    case EXPIRATION_DATE
}

class Loan: JSONSerializable {
    var locationType: LocationType?
    var locationId: String?
    var locationName: String?
    var id: String?
    var loanNumber: Int?
    var loanStatus: LoanStatus?
    var reason: LoanReason?
    var itemClass: ItemClass?
    var serviceStartDate: Int?
    var serviceEndDate: Int?
    var expirationDate: Int?

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
    
    if let locationTypeStringValue = json["locationType"].string {
        if let locationType = LocationType(rawValue: locationTypeStringValue) {
            self.locationType = locationType
        }
    }
    
    if let locationId = json["locationId"].string {
        self.locationId = locationId
    }
    
    if let locationName = json["locationName"].string {
        self.locationName = locationName
    }
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let loanNumber = json["loanNumber"].int {
        self.loanNumber = loanNumber
    }
    
    if let loanStatusStringValue = json["loanStatus"].string {
        if let loanStatus = LoanStatus(rawValue: loanStatusStringValue) {
            self.loanStatus = loanStatus
        }
    }
    
    if let reasonStringValue = json["reason"].string {
        if let reason = LoanReason(rawValue: reasonStringValue) {
            self.reason = reason
        }
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let locationType = self.locationType {
        dictionary["locationType"] = locationType.rawValue
    }
    
    if let locationId = self.locationId {
        dictionary["locationId"] = locationId
    }
    
    if let locationName = self.locationName {
        dictionary["locationName"] = locationName
    }
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let loanNumber = self.loanNumber {
        dictionary["loanNumber"] = loanNumber
    }
    
    if let loanStatus = self.loanStatus {
        dictionary["loanStatus"] = loanStatus.rawValue
    }
    
    if let reason = self.reason {
        dictionary["reason"] = reason.rawValue
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListLoans.Code?
    var loans: [WsListLoans.Loan]?

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
        if let code = WsListLoans.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let loansArrayValue = json["loans"].array {
        self.loans = []
        for item in loansArrayValue {
            if let value = WsListLoans.Loan(json: item), var loans = loans {
                loans.append(value)
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
