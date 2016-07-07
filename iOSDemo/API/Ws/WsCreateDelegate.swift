import Foundation
import SwiftyJSON

struct WsCreateDelegate {

    class Request: WsRequest {
        typealias Response = WsCreateDelegate.Response
        
        var linkType: DirectoryNonPersonType?
        var linkId: String?
        var delegates: [WsCreateDelegate.Delegate]?
        
        class func getPath() -> String {
            return "/dir/delegate/create"
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
            
            if let linkTypeStringValue = json["linkType"].string {
                if let linkType = DirectoryNonPersonType(rawValue: linkTypeStringValue) {
                    self.linkType = linkType
                }
            }
            
            if let linkId = json["linkId"].string {
                self.linkId = linkId
            }
            
            if let delegatesArrayValue = json["delegates"].array {
                self.delegates = []
                for item in delegatesArrayValue {
                    if let value = WsCreateDelegate.Delegate(json: item), var delegates = delegates {
                        delegates.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let linkType = self.linkType {
                dictionary["linkType"] = linkType.rawValue
            }
            
            if let linkId = self.linkId {
                dictionary["linkId"] = linkId
            }
            
            return dictionary
        }
    }

class Delegate: JSONSerializable {
    var delegateId: String?
    var delegateType: PersonType?

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
    
    if let delegateId = json["delegateId"].string {
        self.delegateId = delegateId
    }
    
    if let delegateTypeStringValue = json["delegateType"].string {
        if let delegateType = PersonType(rawValue: delegateTypeStringValue) {
            self.delegateType = delegateType
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let delegateId = self.delegateId {
        dictionary["delegateId"] = delegateId
    }
    
    if let delegateType = self.delegateType {
        dictionary["delegateType"] = delegateType.rawValue
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsCreateDelegate.Code?

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
        if let code = WsCreateDelegate.Code(rawValue: codeStringValue) {
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
    case LINK_ID_REQUIRED
    case LINK_TYPE_REQUIRED
    case DELEGATE_REQUIRED
    case DELEGATE_ID_REQUIRED
    case DELEGATE_TYPE_REQUIRED
    case INVALID_LINK_TYPE
    case FAILED
}

}
