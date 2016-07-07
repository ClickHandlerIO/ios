import Foundation
import SwiftyJSON

struct WsAutoVerifyPackage {

    class Request: WsRequest {
        typealias Response = WsAutoVerifyPackage.Response
        
        var packageId: String?
        var locationType: LocationType?
        var locationId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/autoverifypackage"
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
    var code: WsAutoVerifyPackage.Code?

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
        if let code = WsAutoVerifyPackage.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case PACKAGE_ID_REQUIRED
    case EMPTY_LOCATION_ID
    case EMPTY_LOCATION_TYPE
    case FAILED_TO_DELIVER
    case FAILED
}

}
