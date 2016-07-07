import Foundation
import SwiftyJSON

struct WsUpdatePackage {

    class Request: WsRequest {
        typealias Response = WsUpdatePackage.Response
        
        var packageId: String?
        var trackingNumber: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/updatepackage"
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
            
            if let trackingNumber = json["trackingNumber"].string {
                self.trackingNumber = trackingNumber
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let packageId = self.packageId {
                dictionary["packageId"] = packageId
            }
            
            if let trackingNumber = self.trackingNumber {
                dictionary["trackingNumber"] = trackingNumber
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case PACKAGE_ID_REQUIRED
    case TRACKING_NUMBER_REQUIRED
    case NOT_FOUND
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUpdatePackage.Code?
    var packageEntity: PackageEntity?

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
        if let code = WsUpdatePackage.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.packageEntity = PackageEntity(json: json["packageEntity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let packageEntity = self.packageEntity {
        dictionary["packageEntity"] = packageEntity.asDictionary()
    }
    
    return dictionary
}
}

}
