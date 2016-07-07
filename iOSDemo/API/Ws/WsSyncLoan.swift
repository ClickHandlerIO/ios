import Foundation
import SwiftyJSON

struct WsSyncLoan {

    class Request: WsRequest {
        typealias Response = WsSyncLoan.Response
        
        var loanId: String?
        
        class func getPath() -> String {
            return "/inventory/loan/syncloan"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let loanId = self.loanId {
                dictionary["loanId"] = loanId
            }
            
            return dictionary
        }
    }

class Response: JSONSerializable {
    var code: WsSyncLoan.Code?
    var loanOrderId: String?

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
        if let code = WsSyncLoan.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let loanOrderId = json["loanOrderId"].string {
        self.loanOrderId = loanOrderId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let loanOrderId = self.loanOrderId {
        dictionary["loanOrderId"] = loanOrderId
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case LOAN_NOT_FOUND
    case LOAN_ID_REQUIRED
    case FAILED
}

}
