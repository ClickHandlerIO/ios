import Foundation
import GRDBCipher
import SwiftyJSON

class AeToTeamEntity: AbstractEntity {
    var teamId: String?
    var aeId: String?

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
    
    if let teamId = json["teamId"].string {
        self.teamId = teamId
    }
    
    if let aeId = json["aeId"].string {
        self.aeId = aeId
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let teamId = self.teamId {
        dictionary["teamId"] = teamId
    }
    
    if let aeId = self.aeId {
        dictionary["aeId"] = aeId
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
