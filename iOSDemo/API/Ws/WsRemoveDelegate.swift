import Foundation
import SwiftyJSON

struct WsRemoveDelegate {

    class Request: WsRequest {
        typealias Response = WsRemoveDelegate.Response
        
        var id: String?
        var linkType: DirectoryNonPersonType?
        
        class func getPath() -> String {
            return "/dir/delegate/remove"
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
            
            if let id = json["id"].string {
                self.id = id
            }
            
            if let linkTypeStringValue = json["linkType"].string {
                if let linkType = DirectoryNonPersonType(rawValue: linkTypeStringValue) {
                    self.linkType = linkType
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let linkType = self.linkType {
                dictionary["linkType"] = linkType.rawValue
            }
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case INVALID_ID
    case LINK_TYPE_REQUIRED
    case ID_REQUIRED
    case INVALID_LINK_TYPE
    case FAILED
}

class Response: JSONSerializable {
    var code: WsRemoveDelegate.Code?

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
        if let code = WsRemoveDelegate.Code(rawValue: codeStringValue) {
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
