import Foundation
import SwiftyJSON

struct WsSaveLoanLines {

    class Request: WsRequest {
        typealias Response = WsSaveLoanLines.Response
        
        var loanId: String?
        var loanLines: [WsSaveLoanLines.Line]?
        
        class func getPath() -> String {
            return "/inventory/loan/line/saveloanlines"
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
            
            if let loanId = json["loanId"].string {
                self.loanId = loanId
            }
            
            if let loanLinesArrayValue = json["loanLines"].array {
                self.loanLines = []
                for item in loanLinesArrayValue {
                    if let value = WsSaveLoanLines.Line(json: item), var loanLines = loanLines {
                        loanLines.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let loanId = self.loanId {
                dictionary["loanId"] = loanId
            }
            
            return dictionary
        }
    }

class Line: JSONSerializable {
    var id: String?
    var remove: Bool?
    var itemSetId: String?
    var itemSetVersionId: String?
    var itemId: String?
    var itemVersionId: String?
    var lotId: String?
    var serialId: String?
    var quantityRequested: Int?

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
    
    if let remove = json["remove"].bool {
        self.remove = remove
    }
    
    if let itemSetId = json["itemSetId"].string {
        self.itemSetId = itemSetId
    }
    
    if let itemSetVersionId = json["itemSetVersionId"].string {
        self.itemSetVersionId = itemSetVersionId
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let quantityRequested = json["quantityRequested"].int {
        self.quantityRequested = quantityRequested
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let remove = self.remove {
        dictionary["remove"] = remove
    }
    
    if let itemSetId = self.itemSetId {
        dictionary["itemSetId"] = itemSetId
    }
    
    if let itemSetVersionId = self.itemSetVersionId {
        dictionary["itemSetVersionId"] = itemSetVersionId
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let quantityRequested = self.quantityRequested {
        dictionary["quantityRequested"] = quantityRequested
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ITEM_ID_REQUIRED
    case LOAN_ID_REQUIRED
    case INVALID_REQUEST
    case INVALID_QUANTITY
    case LOAN_NOT_FOUND
    case LOAN_LINE_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsSaveLoanLines.Code?

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
        if let code = WsSaveLoanLines.Code(rawValue: codeStringValue) {
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
