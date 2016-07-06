import Foundation
import GRDBCipher
import SwiftyJSON

class FileEntity: AbstractEntity {
    var name: String?
    var description: String?
    var contentType: String?
    var md5: String?
    var etag: String?
    var compression: Int?
    var size: Int?
    var storeBucket: String?
    var storeId: String?
//    var keyDEFAULT_ALGORITHM: String?
//    var keyAlgorithm: String?
//    var keyKey: String?
//    var keyMd5: String?
    var storageClass: String?
    var status: FileStatus?

// JSON

required init() {
    super.init()
}

convenience required init?(json: JSON?) {
    guard let json = json else {
        return nil
    }
    self.init()
    self.merge(json)
}

override func merge(json: JSON?) {
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
    
    if let md5 = json["md5"].string {
        self.md5 = md5
    }
    
    if let etag = json["etag"].string {
        self.etag = etag
    }
    
    if let compression = json["compression"].int {
        self.compression = compression
    }
    
    if let size = json["size"].int {
        self.size = size
    }
    
    if let storeBucket = json["storeBucket"].string {
        self.storeBucket = storeBucket
    }
    
    if let storeId = json["storeId"].string {
        self.storeId = storeId
    }
    
//    if let key = EncodedKey(json: json["key"]) {
//        self.keyDEFAULT_ALGORITHM = key.DEFAULT_ALGORITHM
//        self.keyAlgorithm = key.algorithm
//        self.keyKey = key.key
//        self.keyMd5 = key.md5
//    }
    
    if let storageClass = json["storageClass"].string {
        self.storageClass = storageClass
    }
    
    if let statusStringValue = json["status"].string {
        if let status = FileStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
}

override func asDictionary() -> [String:AnyObject] {
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
    
    if let md5 = self.md5 {
        dictionary["md5"] = md5
    }
    
    if let etag = self.etag {
        dictionary["etag"] = etag
    }
    
    if let compression = self.compression {
        dictionary["compression"] = compression
    }
    
    if let size = self.size {
        dictionary["size"] = size
    }
    
    if let storeBucket = self.storeBucket {
        dictionary["storeBucket"] = storeBucket
    }
    
    if let storeId = self.storeId {
        dictionary["storeId"] = storeId
    }
    
//    dictionary["key"] = createKey().asDictionary()
    
    if let storageClass = self.storageClass {
        dictionary["storageClass"] = storageClass
    }
    
    if let status = self.status {
        dictionary["status"] = status.rawValue
    }
    
    return dictionary
}

// SQL

override class func databaseTableCreateSql() -> String {
    return ""
}

required init(_ row: Row) {
    super.init(row)
}

override var persistentDictionary: [String:DatabaseValueConvertible?] {
    return [:]
}

// Key

//func createKey() -> EncodedKey {
//    let key = EncodedKey()
//    key.dEFAULT_ALGORITHM = self.keyDEFAULT_ALGORITHM
//    key.algorithm = self.keyAlgorithm
//    key.key = self.keyKey
//    key.md5 = self.keyMd5
//    return key
//}
//
//func applyKey(key: EncodedKey) {
//    self.keyDEFAULT_ALGORITHM = key.DEFAULT_ALGORITHM
//    self.keyAlgorithm = key.algorithm
//    self.keyKey = key.key
//    self.keyMd5 = key.md5
//}
}
