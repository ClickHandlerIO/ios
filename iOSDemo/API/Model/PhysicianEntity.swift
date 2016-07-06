import Foundation
import GRDBCipher
import SwiftyJSON

class PhysicianEntity: AbstractEntity {
    var physicianType: PhysicianType?
    var nameTitle: String?
    var nameGivenName: String?
    var nameMiddleName: String?
    var nameFamilyName: String?
    var nameSuffix: String?
    var nameFullName: String?
    var nameDisplayName: String?
    var nameLocale: Int?
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
    
    if let physicianTypeStringValue = json["physicianType"].string {
        if let physicianType = PhysicianType(rawValue: physicianTypeStringValue) {
            self.physicianType = physicianType
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
    
    if let active = json["active"].bool {
        self.active = active
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let physicianType = self.physicianType {
        dictionary["physicianType"] = physicianType.rawValue
    }
    
    dictionary["name"] = createName().asDictionary()
    
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
}
