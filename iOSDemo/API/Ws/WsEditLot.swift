import Foundation
import SwiftyJSON

struct WsEditLot {

    class Request: WsRequest {
        typealias Response = WsEditLot.Response
        
        var id: String?
        var lotNumber: String?
        var itemVersionId: String?
        var expirationDate: Int?
        var manufactureDate: Int?
        
        class func getPath() -> String {
            return "/inventory/lot/editlot"
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
            
            if let lotNumber = json["lotNumber"].string {
                self.lotNumber = lotNumber
            }
            
            if let itemVersionId = json["itemVersionId"].string {
                self.itemVersionId = itemVersionId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let id = self.id {
                dictionary["id"] = id
            }
            
            if let lotNumber = self.lotNumber {
                dictionary["lotNumber"] = lotNumber
            }
            
            if let itemVersionId = self.itemVersionId {
                dictionary["itemVersionId"] = itemVersionId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsEditLot.Code?

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
        if let code = WsEditLot.Code(rawValue: codeStringValue) {
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
    case ID_REQUIRED
    case LOT_NUMBER_REQUIRED
    case NOT_FOUND
    case DUPLICATE_LOT
    case ITEM_VERSION_REQUIRED
    case FAILED
}

}
