import Foundation
import SwiftyJSON

struct WsUpdatePackageStates {

    class Request: WsRequest {
        typealias Response = WsUpdatePackageStates.Response
        
        var packageIds: [String]?
        var shouldBeState: PackageState?
        var changeToState: PackageState?
        
        class func getPath() -> String {
            return "/state/updatepackagestates"
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
            
            if let packageIdsArrayValue = json["packageIds"].array {
                self.packageIds = []
                for item in packageIdsArrayValue {
                    if var packageIds = packageIds, let itemValue = item.string {
                        packageIds.append(itemValue)
                    }
                }
            }
            
            if let shouldBeStateStringValue = json["shouldBeState"].string {
                if let shouldBeState = PackageState(rawValue: shouldBeStateStringValue) {
                    self.shouldBeState = shouldBeState
                }
            }
            
            if let changeToStateStringValue = json["changeToState"].string {
                if let changeToState = PackageState(rawValue: changeToStateStringValue) {
                    self.changeToState = changeToState
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let shouldBeState = self.shouldBeState {
                dictionary["shouldBeState"] = shouldBeState.rawValue
            }
            
            if let changeToState = self.changeToState {
                dictionary["changeToState"] = changeToState.rawValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case PACKAGE_ID_REQUIRED
    case STATE_REQUIRED
    case SHOULD_BE_STATE_REQUIRED
    case CHANGE_TO_STATE_REQUIRED
    case UNEXPECTED_STATE
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUpdatePackageStates.Code?

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
        if let code = WsUpdatePackageStates.Code(rawValue: codeStringValue) {
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

}
