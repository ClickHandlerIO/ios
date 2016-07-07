import Foundation
import SwiftyJSON

struct WsCompletePick {

    class Request: WsRequest {
        typealias Response = WsCompletePick.Response
        
        var completions: [Completion]?
        
        class func getPath() -> String {
            return "/inventory/sourcing/completepick"
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
            
            if let completionsArrayValue = json["completions"].array {
                self.completions = []
                for item in completionsArrayValue {
                    if let value = Completion(json: item), var completions = completions {
                        completions.append(value)
                    }
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

enum Code: String {
    case SUCCESS
    case COMPLETION_REQUIRED
    case FAILED
}

class Response: JSONSerializable {
    var code: WsCompletePick.Code?
    var completionResults: [CompletionResult]?

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
        if let code = WsCompletePick.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let completionResultsArrayValue = json["completionResults"].array {
        self.completionResults = []
        for item in completionResultsArrayValue {
            if let value = CompletionResult(json: item), var completionResults = completionResults {
                completionResults.append(value)
            }
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
