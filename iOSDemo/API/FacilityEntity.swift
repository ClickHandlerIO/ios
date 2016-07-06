import Foundation
import GRDBCipher
import SwiftyJSON

class FacilityEntity: AbstractEntity {
    var orgId: String?
    var orgType: OrgType?
    var facilityType: FacilityType?
    var name: String?
    var addressLine1: String?
    var addressLine2: String?
    var addressLine3: String?
    var addressCity: String?
    var addressState: String?
    var addressPostalCode: String?
    var addressCountry: String?
    var timeZone: TZ?
    var caseLoaningMethodology: CaseLoaningMethodology?
    var restockType: RestockType?
    var binManaged: Bool?
    var autoPutAway: Bool?
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

        if let facilityTypeStringValue = json["facilityType"].string {
            if let facilityType = FacilityType(rawValue: facilityTypeStringValue) {
                self.facilityType = facilityType
            }
        }

        if let name = json["name"].string {
            self.name = name
        }

        if let address = Address(json: json["address"]) {
            self.addressLine1 = address.line1
            self.addressLine2 = address.line2
            self.addressLine3 = address.line3
            self.addressCity = address.city
            self.addressState = address.state
            self.addressPostalCode = address.postalCode
            self.addressCountry = address.country
        }

        if let timeZoneStringValue = json["timeZone"].string {
            if let timeZone = TZ(rawValue: timeZoneStringValue) {
                self.timeZone = timeZone
            }
        }

        if let caseLoaningMethodologyStringValue = json["caseLoaningMethodology"].string {
            if let caseLoaningMethodology = CaseLoaningMethodology(rawValue: caseLoaningMethodologyStringValue) {
                self.caseLoaningMethodology = caseLoaningMethodology
            }
        }

        if let restockTypeStringValue = json["restockType"].string {
            if let restockType = RestockType(rawValue: restockTypeStringValue) {
                self.restockType = restockType
            }
        }

        if let binManaged = json["binManaged"].bool {
            self.binManaged = binManaged
        }

        if let autoPutAway = json["autoPutAway"].bool {
            self.autoPutAway = autoPutAway
        }

        if let active = json["active"].bool {
            self.active = active
        }
    }

    override func asDictionary() -> [String:AnyObject] {
        var dictionary: [String:AnyObject] = [:]

        if let orgId = self.orgId {
            dictionary["orgId"] = orgId
        }

        if let orgType = self.orgType {
            dictionary["orgType"] = orgType.rawValue
        }

        if let facilityType = self.facilityType {
            dictionary["facilityType"] = facilityType.rawValue
        }

        if let name = self.name {
            dictionary["name"] = name
        }

        dictionary["address"] = createAddress().asDictionary()

        if let timeZone = self.timeZone {
            dictionary["timeZone"] = timeZone.rawValue
        }

        if let caseLoaningMethodology = self.caseLoaningMethodology {
            dictionary["caseLoaningMethodology"] = caseLoaningMethodology.rawValue
        }

        if let restockType = self.restockType {
            dictionary["restockType"] = restockType.rawValue
        }

        if let binManaged = self.binManaged {
            dictionary["binManaged"] = binManaged
        }

        if let autoPutAway = self.autoPutAway {
            dictionary["autoPutAway"] = autoPutAway
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

// Address

    func createAddress() -> Address {
        let address = Address()
        address.line1 = self.addressLine1
        address.line2 = self.addressLine2
        address.line3 = self.addressLine3
        address.city = self.addressCity
        address.state = self.addressState
        address.postalCode = self.addressPostalCode
        address.country = self.addressCountry
        return address
    }

    func applyAddress(address: Address) {
        self.addressLine1 = address.line1
        self.addressLine2 = address.line2
        self.addressLine3 = address.line3
        self.addressCity = address.city
        self.addressState = address.state
        self.addressPostalCode = address.postalCode
        self.addressCountry = address.country
    }
}
