import Foundation
import GRDBCipher
import SwiftyJSON

class HoldReasonEntity: AbstractEntity {
    var orgId: String?
    var name: String?

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
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let name = json["name"].string {
        self.name = name
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let name = self.name {
        dictionary["name"] = name
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
}
