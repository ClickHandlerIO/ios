import Foundation
import GRDBCipher
import SwiftyJSON

class UserEntity: AbstractEntity {
    var organizationId: String?
    var userPerspective: UserPerspective?
    var linkedId: String?
    var email: String?
    var signupDate: Int?
    var username: String?
    var password: String?
    var timeZone: TZ?
    var availablePerspective: AvailablePerspective?
    var apiToken: String?
    var status: UserStatus?

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
    
    if let organizationId = json["organizationId"].string {
        self.organizationId = organizationId
    }
    
    if let userPerspectiveStringValue = json["userPerspective"].string {
        if let userPerspective = UserPerspective(rawValue: userPerspectiveStringValue) {
            self.userPerspective = userPerspective
        }
    }
    
    if let linkedId = json["linkedId"].string {
        self.linkedId = linkedId
    }
    
    if let email = json["email"].string {
        self.email = email
    }
    
    if let username = json["username"].string {
        self.username = username
    }
    
    if let password = json["password"].string {
        self.password = password
    }
    
    if let timeZoneStringValue = json["timeZone"].string {
        if let timeZone = TZ(rawValue: timeZoneStringValue) {
            self.timeZone = timeZone
        }
    }
    
    if let availablePerspectiveStringValue = json["availablePerspective"].string {
        if let availablePerspective = AvailablePerspective(rawValue: availablePerspectiveStringValue) {
            self.availablePerspective = availablePerspective
        }
    }
    
    if let apiToken = json["apiToken"].string {
        self.apiToken = apiToken
    }
    
    if let statusStringValue = json["status"].string {
        if let status = UserStatus(rawValue: statusStringValue) {
            self.status = status
        }
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let organizationId = self.organizationId {
        dictionary["organizationId"] = organizationId
    }
    
    if let userPerspective = self.userPerspective {
        dictionary["userPerspective"] = userPerspective.rawValue
    }
    
    if let linkedId = self.linkedId {
        dictionary["linkedId"] = linkedId
    }
    
    if let email = self.email {
        dictionary["email"] = email
    }
    
    if let username = self.username {
        dictionary["username"] = username
    }
    
    if let password = self.password {
        dictionary["password"] = password
    }
    
    if let timeZone = self.timeZone {
        dictionary["timeZone"] = timeZone.rawValue
    }
    
    if let availablePerspective = self.availablePerspective {
        dictionary["availablePerspective"] = availablePerspective.rawValue
    }
    
    if let apiToken = self.apiToken {
        dictionary["apiToken"] = apiToken
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
}
