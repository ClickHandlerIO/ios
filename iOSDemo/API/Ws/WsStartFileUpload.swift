import Foundation
import SwiftyJSON

struct WsStartFileUpload {

    class Request: WsRequest {
        typealias Response = WsStartFileUpload.Response
        
        var name: String?
        var description: String?
        var contentType: String?
        var size: Int?
        var uploadType: WsStartFileUpload.UploadType?
        
        class func getPath() -> String {
            return "/files/upload"
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
            
            if let name = json["name"].string {
                self.name = name
            }
            
            if let description = json["description"].string {
                self.description = description
            }
            
            if let contentType = json["contentType"].string {
                self.contentType = contentType
            }
            
            if let size = json["size"].int {
                self.size = size
            }
            
            if let uploadTypeStringValue = json["uploadType"].string {
                if let uploadType = WsStartFileUpload.UploadType(rawValue: uploadTypeStringValue) {
                    self.uploadType = uploadType
                }
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let name = self.name {
                dictionary["name"] = name
            }
            
            if let description = self.description {
                dictionary["description"] = description
            }
            
            if let contentType = self.contentType {
                dictionary["contentType"] = contentType
            }
            
            if let size = self.size {
                dictionary["size"] = size
            }
            
            if let uploadType = self.uploadType {
                dictionary["uploadType"] = uploadType.rawValue
            }
            
            return dictionary
        }
    }

enum UploadType: String {
    case EMAIL
    case MESSAGE
    case CASE
}

class Response: JSONSerializable {
    var code: WsStartFileUpload.Code?
    var entity: FileEntity?

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
        if let code = WsStartFileUpload.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    self.entity = FileEntity(json: json["entity"])
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    if let entity = self.entity {
        dictionary["entity"] = entity.asDictionary()
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case EMPTY_NAME
    case EMPTY_CONTENT_TYPE
    case INVALID_SIZE
    case EMPTY_UPLOAD_TYPE
    case FILE_TOO_LARGE
    case INVALID_UPLOAD_TYPE
    case GET_MAP_FAILED
    case PUT_FAILED
    case FAILED
}

}
