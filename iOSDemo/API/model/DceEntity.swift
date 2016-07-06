import Foundation
import GRDBCipher
import SwiftyJSON

class DceEntity: AbstractEntity {
    var orgId: String?
    var orgType: OrgType?
    var workingHomeId: String?
    var workingAtId: String?
    var nameTitle: String?
    var nameGivenName: String?
    var nameMiddleName: String?
    var nameFamilyName: String?
    var nameSuffix: String?
    var nameFullName: String?
    var nameDisplayName: String?
    var nameLocale: Int?
    var emailUser: String?
    var emailDomain: String?
    var emailSuffix: String?
    var active: Bool?

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
    
    if let orgTypeStringValue = json["orgType"].string {
        if let orgType = OrgType(rawValue: orgTypeStringValue) {
            self.orgType = orgType
        }
    }
    
    if let workingHomeId = json["workingHomeId"].string {
        self.workingHomeId = workingHomeId
    }
    
    if let workingAtId = json["workingAtId"].string {
        self.workingAtId = workingAtId
    }
    
    if let name = PersonName(json: json["name"]) {
        self.nameTitle = name.title
        self.nameGivenName = name.givenName
        self.nameMiddleName = name.middleName
        self.nameFamilyName = name.familyName
        self.nameSuffix = name.suffix
        self.nameFullName = name.fullName
        self.nameDisplayName = name.displayName
        self.nameLocale = name.locale
    }
    
    if let email = Email(json: json["email"]) {
        self.emailUser = email.user
        self.emailDomain = email.domain
        self.emailSuffix = email.suffix
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let orgType = self.orgType {
        dictionary["orgType"] = orgType.rawValue
    }
    
    if let workingHomeId = self.workingHomeId {
        dictionary["workingHomeId"] = workingHomeId
    }
    
    if let workingAtId = self.workingAtId {
        dictionary["workingAtId"] = workingAtId
    }
    
    dictionary["name"] = createName().asDictionary()
    
    dictionary["email"] = createEmail().asDictionary()
    
    if let active = self.active {
        dictionary["active"] = active
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

// Name

func createName() -> PersonName {
    let name = PersonName()
    name.title = self.nameTitle
    name.givenName = self.nameGivenName
    name.middleName = self.nameMiddleName
    name.familyName = self.nameFamilyName
    name.suffix = self.nameSuffix
    name.fullName = self.nameFullName
    name.displayName = self.nameDisplayName
    name.locale = self.nameLocale
    return name
}

func applyName(name: PersonName) {
    self.nameTitle = name.title
    self.nameGivenName = name.givenName
    self.nameMiddleName = name.middleName
    self.nameFamilyName = name.familyName
    self.nameSuffix = name.suffix
    self.nameFullName = name.fullName
    self.nameDisplayName = name.displayName
    self.nameLocale = name.locale
}

// Email

func createEmail() -> Email {
    let email = Email()
    email.user = self.emailUser
    email.domain = self.emailDomain
    email.suffix = self.emailSuffix
    return email
}

func applyEmail(email: Email) {
    self.emailUser = email.user
    self.emailDomain = email.domain
    self.emailSuffix = email.suffix
}
}
