import Foundation
import SwiftyJSON

struct WsPendingPoReportGraph {

    class Request: WsRequest {
        typealias Response = WsPendingPoReportGraph.Response
        
        var startDate: Int?
        var endDate: Int?
        
        class func getPath() -> String {
            return "/inventory/reports/pendingpograph"
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
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            return dictionary
        }
    }

class PoReportGraphData: JSONSerializable {
    var date: Int?
    var total: Double?

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
    
    if let total = json["total"].double {
        self.total = total
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let total = self.total {
        dictionary["total"] = total
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsPendingPoReportGraph.Code?
    var dataTotal: [WsPendingPoReportGraph.PoReportGraphData]?
    var dataWithPo: [WsPendingPoReportGraph.PoReportGraphData]?
    var dataWithOutPo: [WsPendingPoReportGraph.PoReportGraphData]?

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
        if let code = WsPendingPoReportGraph.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let dataTotalArrayValue = json["dataTotal"].array {
        self.dataTotal = []
        for item in dataTotalArrayValue {
            if let value = WsPendingPoReportGraph.PoReportGraphData(json: item), var dataTotal = dataTotal {
                dataTotal.append(value)
            }
        }
    }
    
    if let dataWithPoArrayValue = json["dataWithPo"].array {
        self.dataWithPo = []
        for item in dataWithPoArrayValue {
            if let value = WsPendingPoReportGraph.PoReportGraphData(json: item), var dataWithPo = dataWithPo {
                dataWithPo.append(value)
            }
        }
    }
    
    if let dataWithOutPoArrayValue = json["dataWithOutPo"].array {
        self.dataWithOutPo = []
        for item in dataWithOutPoArrayValue {
            if let value = WsPendingPoReportGraph.PoReportGraphData(json: item), var dataWithOutPo = dataWithOutPo {
                dataWithOutPo.append(value)
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

enum Code: String {
    case SUCCESS
    case CONTEXT_REQUIRED
    case START_AND_END_DATE_REQUIRED
    case FAILED
}

}
