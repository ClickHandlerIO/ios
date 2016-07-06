import Foundation
import GRDBCipher
import SwiftyJSON

class ContactEntity: AbstractEntity {
    var linkedType: ContactType?
    var linkedId: String?
    var emailUser: String?
    var emailDomain: String?
    var emailSuffix: String?
    var nameTitle: String?
    var nameGivenName: String?
    var nameMiddleName: String?
    var nameFamilyName: String?
    var nameSuffix: String?
    var nameFullName: String?
    var nameDisplayName: String?
    var nameLocale: Int?
    var formattedName: String?
    var organizationId: String?
    var organizationName: String?
    var publicVisible: Bool?
    var description: String?
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
    
    if let linkedTypeStringValue = json["linkedType"].string {
        if let linkedType = ContactType(rawValue: linkedTypeStringValue) {
            self.linkedType = linkedType
        }
    }
    
    if let linkedId = json["linkedId"].string {
        self.linkedId = linkedId
    }
    
    if let email = Email(json: json["email"]) {
        self.emailUser = email.user
        self.emailDomain = email.domain
        self.emailSuffix = email.suffix
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
    
    if let formattedName = json["formattedName"].string {
        self.formattedName = formattedName
    }
    
    if let organizationId = json["organizationId"].string {
        self.organizationId = organizationId
    }
    
    if let organizationName = json["organizationName"].string {
        self.organizationName = organizationName
    }
    
    if let publicVisible = json["publicVisible"].bool {
        self.publicVisible = publicVisible
    }
    
    if let description = json["description"].string {
        self.description = description
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let linkedType = self.linkedType {
        dictionary["linkedType"] = linkedType.rawValue
    }
    
    if let linkedId = self.linkedId {
        dictionary["linkedId"] = linkedId
    }
    
    dictionary["email"] = createEmail().asDictionary()
    
    dictionary["name"] = createName().asDictionary()
    
    if let formattedName = self.formattedName {
        dictionary["formattedName"] = formattedName
    }
    
    if let organizationId = self.organizationId {
        dictionary["organizationId"] = organizationId
    }
    
    if let organizationName = self.organizationName {
        dictionary["organizationName"] = organizationName
    }
    
    if let publicVisible = self.publicVisible {
        dictionary["publicVisible"] = publicVisible
    }
    
    if let description = self.description {
        dictionary["description"] = description
    }
    
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
}
