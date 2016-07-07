import Foundation
import SwiftyJSON

struct WsUpdateLoanStatus {

    class Request: WsRequest {
        typealias Response = WsUpdateLoanStatus.Response
        
        var loanId: String?
        var loanStatus: LoanStatus?
        
        class func getPath() -> String {
            return "/inventory/loan/updateloanstatus"
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
    case STATUS_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsUpdateLoanStatus.Code?

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
        if let code = WsUpdateLoanStatus.Code(rawValue: codeStringValue) {
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
