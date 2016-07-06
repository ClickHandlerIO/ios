import Foundation
import GRDBCipher
import SwiftyJSON

class PatientEntity: AbstractEntity {
    var healthSystemId: String?
    var userId: String?
    var nameTitle: String?
    var nameGivenName: String?
    var nameMiddleName: String?
    var nameFamilyName: String?
    var nameSuffix: String?
    var nameFullName: String?
    var nameDisplayName: String?
    var nameLocale: Int?
    var ssn: String?
    var mrn: String?
    var active: Bool?
    var dateOfBirth: Int?
    var type_: PatientType?
    var gender: Gender?

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
    
    if let healthSystemId = json["healthSystemId"].string {
        self.healthSystemId = healthSystemId
    }
    
    if let userId = json["userId"].string {
        self.userId = userId
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
    
    if let ssn = json["ssn"].string {
        self.ssn = ssn
    }
    
    if let mrn = json["mrn"].string {
        self.mrn = mrn
    }
    
    if let active = json["active"].bool {
        self.active = active
    }
    
    if let type_StringValue = json["type"].string {
        if let type_ = PatientType(rawValue: type_StringValue) {
            self.type_ = type_
        }
    }
    
    if let genderStringValue = json["gender"].string {
        if let gender = Gender(rawValue: genderStringValue) {
            self.gender = gender
        }
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let healthSystemId = self.healthSystemId {
        dictionary["healthSystemId"] = healthSystemId
    }
    
    if let userId = self.userId {
        dictionary["userId"] = userId
    }
    
    dictionary["name"] = createName().asDictionary()
    
    if let ssn = self.ssn {
        dictionary["ssn"] = ssn
    }
    
    if let mrn = self.mrn {
        dictionary["mrn"] = mrn
    }
    
    if let active = self.active {
        dictionary["active"] = active
    }
    
    if let type_ = self.type_ {
        dictionary["type"] = type_.rawValue
    }
    
    if let gender = self.gender {
        dictionary["gender"] = gender.rawValue
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
}
