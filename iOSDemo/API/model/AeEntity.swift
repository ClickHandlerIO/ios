import Foundation
import GRDBCipher
import SwiftyJSON

class AeEntity: AbstractEntity {
    var orgId: String?
    var orgType: OrgType?
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
    var workPhoneNumberCountryCode: String?
    var workPhoneNumberAreaCode: String?
    var workPhoneNumberPhoneNumber: String?
    var workPhoneNumberExtension: String?
    var mobilePhoneNumberCountryCode: String?
    var mobilePhoneNumberAreaCode: String?
    var mobilePhoneNumberPhoneNumber: String?
    var mobilePhoneNumberExtension: String?
    var faxNumberCountryCode: String?
    var faxNumberAreaCode: String?
    var faxNumberPhoneNumber: String?
    var faxNumberExtension: String?
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
    
    if let workPhoneNumber = PhoneNumber(json: json["workPhoneNumber"]) {
        self.workPhoneNumberCountryCode = workPhoneNumber.countryCode
        self.workPhoneNumberAreaCode = workPhoneNumber.areaCode
        self.workPhoneNumberPhoneNumber = workPhoneNumber.phoneNumber
        self.workPhoneNumberExtension = workPhoneNumber.extension_
    }
    
    if let mobilePhoneNumber = PhoneNumber(json: json["mobilePhoneNumber"]) {
        self.mobilePhoneNumberCountryCode = mobilePhoneNumber.countryCode
        self.mobilePhoneNumberAreaCode = mobilePhoneNumber.areaCode
        self.mobilePhoneNumberPhoneNumber = mobilePhoneNumber.phoneNumber
        self.mobilePhoneNumberExtension = mobilePhoneNumber.extension_
    }
    
    if let faxNumber = PhoneNumber(json: json["faxNumber"]) {
        self.faxNumberCountryCode = faxNumber.countryCode
        self.faxNumberAreaCode = faxNumber.areaCode
        self.faxNumberPhoneNumber = faxNumber.phoneNumber
        self.faxNumberExtension = faxNumber.extension_
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
    
    dictionary["name"] = createName().asDictionary()
    
    dictionary["email"] = createEmail().asDictionary()
    
    dictionary["workPhoneNumber"] = createWorkPhoneNumber().asDictionary()
    
    dictionary["mobilePhoneNumber"] = createMobilePhoneNumber().asDictionary()
    
    dictionary["faxNumber"] = createFaxNumber().asDictionary()
    
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

// WorkPhoneNumber

func createWorkPhoneNumber() -> PhoneNumber {
    let workPhoneNumber = PhoneNumber()
    workPhoneNumber.countryCode = self.workPhoneNumberCountryCode
    workPhoneNumber.areaCode = self.workPhoneNumberAreaCode
    workPhoneNumber.phoneNumber = self.workPhoneNumberPhoneNumber
    workPhoneNumber.extension_ = self.workPhoneNumberExtension
    return workPhoneNumber
}

func applyWorkPhoneNumber(workPhoneNumber: PhoneNumber) {
    self.workPhoneNumberCountryCode = workPhoneNumber.countryCode
    self.workPhoneNumberAreaCode = workPhoneNumber.areaCode
    self.workPhoneNumberPhoneNumber = workPhoneNumber.phoneNumber
    self.workPhoneNumberExtension = workPhoneNumber.extension_
}

// MobilePhoneNumber

func createMobilePhoneNumber() -> PhoneNumber {
    let mobilePhoneNumber = PhoneNumber()
    mobilePhoneNumber.countryCode = self.mobilePhoneNumberCountryCode
    mobilePhoneNumber.areaCode = self.mobilePhoneNumberAreaCode
    mobilePhoneNumber.phoneNumber = self.mobilePhoneNumberPhoneNumber
    mobilePhoneNumber.extension_ = self.mobilePhoneNumberExtension
    return mobilePhoneNumber
}

func applyMobilePhoneNumber(mobilePhoneNumber: PhoneNumber) {
    self.mobilePhoneNumberCountryCode = mobilePhoneNumber.countryCode
    self.mobilePhoneNumberAreaCode = mobilePhoneNumber.areaCode
    self.mobilePhoneNumberPhoneNumber = mobilePhoneNumber.phoneNumber
    self.mobilePhoneNumberExtension = mobilePhoneNumber.extension_
}

// FaxNumber

func createFaxNumber() -> PhoneNumber {
    let faxNumber = PhoneNumber()
    faxNumber.countryCode = self.faxNumberCountryCode
    faxNumber.areaCode = self.faxNumberAreaCode
    faxNumber.phoneNumber = self.faxNumberPhoneNumber
    faxNumber.extension_ = self.faxNumberExtension
    return faxNumber
}

func applyFaxNumber(faxNumber: PhoneNumber) {
    self.faxNumberCountryCode = faxNumber.countryCode
    self.faxNumberAreaCode = faxNumber.areaCode
    self.faxNumberPhoneNumber = faxNumber.phoneNumber
    self.faxNumberExtension = faxNumber.extension_
}
}
