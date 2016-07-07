import Foundation
import SwiftyJSON

struct WsUpdateLoan {

    class Request: WsRequest {
        typealias Response = WsUpdateLoan.Response
        
        var loanId: String?
        var expirationDate: Int?
        var itemClass: ItemClass?
        var loanStatus: LoanStatus?
        
        class func getPath() -> String {
            return "/inventory/loan/updateloan"
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
            
            if let itemClassStringValue = json["itemClass"].string {
                if let itemClass = ItemClass(rawValue: itemClassStringValue) {
                    self.itemClass = itemClass
                }
            }
            
            if let loanStatusStringValue = json["loanStatus"].string {
                if let loanStatus = LoanStatus(rawValue: loanStatusStringValue) {
                    self.loanStatus = loanStatus
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let loanId = self.loanId {
                dictionary["loanId"] = loanId
            }
            
            if let itemClass = self.itemClass {
                dictionary["itemClass"] = itemClass.rawValue
            }
            
            if let loanStatus = self.loanStatus {
                dictionary["loanStatus"] = loanStatus.rawValue
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

class Response: JSONSerializable {
    var code: WsUpdateLoan.Code?

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
        if let code = WsUpdateLoan.Code(rawValue: codeStringValue) {
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
