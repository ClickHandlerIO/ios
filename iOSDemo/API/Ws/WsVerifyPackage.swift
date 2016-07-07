import Foundation
import SwiftyJSON

struct WsVerifyPackage {

    class Request: WsRequest {
        typealias Response = WsVerifyPackage.Response
        
        var packageId: String?
        var stockIds: [String]?
        var unexpectedItems: [UnexpectedItem]?
        var locationType: LocationType?
        var locationId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/verifypackage"
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
            
            if let packageId = json["packageId"].string {
                self.packageId = packageId
            }
            
            if let stockIdsArrayValue = json["stockIds"].array {
                self.stockIds = []
                for item in stockIdsArrayValue {
                    if var stockIds = stockIds, let itemValue = item.string {
                        stockIds.append(itemValue)
                    }
                }
            }
            
            if let unexpectedItemsArrayValue = json["unexpectedItems"].array {
                self.unexpectedItems = []
                for item in unexpectedItemsArrayValue {
                    if let value = UnexpectedItem(json: item), var unexpectedItems = unexpectedItems {
                        unexpectedItems.append(value)
                    }
                }
            }
            
            if let locationTypeStringValue = json["locationType"].string {
                if let locationType = LocationType(rawValue: locationTypeStringValue) {
                    self.locationType = locationType
                }
            }
            
            if let locationId = json["locationId"].string {
                self.locationId = locationId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let packageId = self.packageId {
                dictionary["packageId"] = packageId
            }
            
            if let locationType = self.locationType {
                dictionary["locationType"] = locationType.rawValue
            }
            
            if let locationId = self.locationId {
                dictionary["locationId"] = locationId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsVerifyPackage.Code?
    var unexpectedItemResults: [UnexpectedItemResult]?

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
        if let code = WsVerifyPackage.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let unexpectedItemResultsArrayValue = json["unexpectedItemResults"].array {
        self.unexpectedItemResults = []
        for item in unexpectedItemResultsArrayValue {
            if let value = UnexpectedItemResult(json: item), var unexpectedItemResults = unexpectedItemResults {
                unexpectedItemResults.append(value)
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
    case PACKAGE_ID_REQUIRED
    case STOCK_REQUIRED
    case IMPROPER_PACKAGE_STATE
    case DUPLICATE_STOCK
    case EMPTY_LOCATION_ID
    case EMPTY_LOCATION_TYPE
    case FAILED_TO_DELIVER
    case FAILED
}

}
