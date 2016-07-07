import Foundation
import SwiftyJSON

struct WsCreatePackage {

    class Request: WsRequest {
        typealias Response = WsCreatePackage.Response
        
        var shipmentId: String?
        
        class func getPath() -> String {
            return "/inventory/shipping/packages/createpackage"
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
            
            if let shipmentId = json["shipmentId"].string {
                self.shipmentId = shipmentId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let shipmentId = self.shipmentId {
                dictionary["shipmentId"] = shipmentId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsCreatePackage.Code?
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
        if let code = WsCreatePackage.Code(rawValue: codeStringValue) {
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

enum Code: String {
    case SUCCESS
    case SHIPMENT_ID_REQUIRED
    case FAILED
}

}
