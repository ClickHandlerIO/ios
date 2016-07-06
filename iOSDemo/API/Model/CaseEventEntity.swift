import Foundation
import GRDBCipher
import SwiftyJSON

class CaseEventEntity: AbstractEntity {
    var eventId: String?
    var caseNumber: Int?
    var caseEventStatus: CaseEventStatus?
    var caseEventOpsStatus: CaseEventOpsStatus?
    var caseEventSalesStatus: CaseEventSalesStatus?
    var caseEventState: CaseEventState?
    var stateChanged: Int?
    var healthSystemId: String?
    var mdcId: String?
    var mdcBizUnitId: String?
    var mdcSalesOuId: String?
    var mdcOpsOuId: String?
    var facilityId: String?
    var surgeonPhysicianId: String?
    var hcrId: String?
    var teamId: String?
    var coverageId: String?
    var procedureId: String?
    var bodySide: BodySide?
    var patientId: String?
    var patientNameTitle: String?
    var patientNameGivenName: String?
    var patientNameMiddleName: String?
    var patientNameFamilyName: String?
    var patientNameSuffix: String?
    var patientNameFullName: String?
    var patientNameDisplayName: String?
    var patientNameLocale: Int?
    var patientDob: Int?
    var patientGender: Gender?
    var description: String?
    var splitImplantsInstruments: Bool?
    var treatMixedAsImplants: Bool?
    var implantLoanOrderId: String?
    var instrumentLoanOrderId: String?
    var implantLoanId: String?
    var instrumentLoanId: String?
    var cancelReason: CancelReason?
    var cancelNote: String?

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
    
    if let eventId = json["eventId"].string {
        self.eventId = eventId
    }
    
    if let caseNumber = json["caseNumber"].int {
        self.caseNumber = caseNumber
    }
    
    if let caseEventStatusStringValue = json["caseEventStatus"].string {
        if let caseEventStatus = CaseEventStatus(rawValue: caseEventStatusStringValue) {
            self.caseEventStatus = caseEventStatus
        }
    }
    
    if let caseEventOpsStatusStringValue = json["caseEventOpsStatus"].string {
        if let caseEventOpsStatus = CaseEventOpsStatus(rawValue: caseEventOpsStatusStringValue) {
            self.caseEventOpsStatus = caseEventOpsStatus
        }
    }
    
    if let caseEventSalesStatusStringValue = json["caseEventSalesStatus"].string {
        if let caseEventSalesStatus = CaseEventSalesStatus(rawValue: caseEventSalesStatusStringValue) {
            self.caseEventSalesStatus = caseEventSalesStatus
        }
    }
    
    if let caseEventStateStringValue = json["caseEventState"].string {
        if let caseEventState = CaseEventState(rawValue: caseEventStateStringValue) {
            self.caseEventState = caseEventState
        }
    }
    
    if let healthSystemId = json["healthSystemId"].string {
        self.healthSystemId = healthSystemId
    }
    
    if let mdcId = json["mdcId"].string {
        self.mdcId = mdcId
    }
    
    if let mdcBizUnitId = json["mdcBizUnitId"].string {
        self.mdcBizUnitId = mdcBizUnitId
    }
    
    if let mdcSalesOuId = json["mdcSalesOuId"].string {
        self.mdcSalesOuId = mdcSalesOuId
    }
    
    if let mdcOpsOuId = json["mdcOpsOuId"].string {
        self.mdcOpsOuId = mdcOpsOuId
    }
    
    if let facilityId = json["facilityId"].string {
        self.facilityId = facilityId
    }
    
    if let surgeonPhysicianId = json["surgeonPhysicianId"].string {
        self.surgeonPhysicianId = surgeonPhysicianId
    }
    
    if let hcrId = json["hcrId"].string {
        self.hcrId = hcrId
    }
    
    if let teamId = json["teamId"].string {
        self.teamId = teamId
    }
    
    if let coverageId = json["coverageId"].string {
        self.coverageId = coverageId
    }
    
    if let procedureId = json["procedureId"].string {
        self.procedureId = procedureId
    }
    
    if let bodySideStringValue = json["bodySide"].string {
        if let bodySide = BodySide(rawValue: bodySideStringValue) {
            self.bodySide = bodySide
        }
    }
    
    if let patientId = json["patientId"].string {
        self.patientId = patientId
    }
    
    if let patientName = PersonName(json: json["patientName"]) {
        self.patientNameTitle = patientName.title
        self.patientNameGivenName = patientName.givenName
        self.patientNameMiddleName = patientName.middleName
        self.patientNameFamilyName = patientName.familyName
        self.patientNameSuffix = patientName.suffix
        self.patientNameFullName = patientName.fullName
        self.patientNameDisplayName = patientName.displayName
        self.patientNameLocale = patientName.locale
    }
    
    if let patientGenderStringValue = json["patientGender"].string {
        if let patientGender = Gender(rawValue: patientGenderStringValue) {
            self.patientGender = patientGender
        }
    }
    
    if let description = json["description"].string {
        self.description = description
    }
    
    if let splitImplantsInstruments = json["splitImplantsInstruments"].bool {
        self.splitImplantsInstruments = splitImplantsInstruments
    }
    
    if let treatMixedAsImplants = json["treatMixedAsImplants"].bool {
        self.treatMixedAsImplants = treatMixedAsImplants
    }
    
    if let implantLoanOrderId = json["implantLoanOrderId"].string {
        self.implantLoanOrderId = implantLoanOrderId
    }
    
    if let instrumentLoanOrderId = json["instrumentLoanOrderId"].string {
        self.instrumentLoanOrderId = instrumentLoanOrderId
    }
    
    if let implantLoanId = json["implantLoanId"].string {
        self.implantLoanId = implantLoanId
    }
    
    if let instrumentLoanId = json["instrumentLoanId"].string {
        self.instrumentLoanId = instrumentLoanId
    }
    
    if let cancelReasonStringValue = json["cancelReason"].string {
        if let cancelReason = CancelReason(rawValue: cancelReasonStringValue) {
            self.cancelReason = cancelReason
        }
    }
    
    if let cancelNote = json["cancelNote"].string {
        self.cancelNote = cancelNote
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let eventId = self.eventId {
        dictionary["eventId"] = eventId
    }
    
    if let caseNumber = self.caseNumber {
        dictionary["caseNumber"] = caseNumber
    }
    
    if let caseEventStatus = self.caseEventStatus {
        dictionary["caseEventStatus"] = caseEventStatus.rawValue
    }
    
    if let caseEventOpsStatus = self.caseEventOpsStatus {
        dictionary["caseEventOpsStatus"] = caseEventOpsStatus.rawValue
    }
    
    if let caseEventSalesStatus = self.caseEventSalesStatus {
        dictionary["caseEventSalesStatus"] = caseEventSalesStatus.rawValue
    }
    
    if let caseEventState = self.caseEventState {
        dictionary["caseEventState"] = caseEventState.rawValue
    }
    
    if let healthSystemId = self.healthSystemId {
        dictionary["healthSystemId"] = healthSystemId
    }
    
    if let mdcId = self.mdcId {
        dictionary["mdcId"] = mdcId
    }
    
    if let mdcBizUnitId = self.mdcBizUnitId {
        dictionary["mdcBizUnitId"] = mdcBizUnitId
    }
    
    if let mdcSalesOuId = self.mdcSalesOuId {
        dictionary["mdcSalesOuId"] = mdcSalesOuId
    }
    
    if let mdcOpsOuId = self.mdcOpsOuId {
        dictionary["mdcOpsOuId"] = mdcOpsOuId
    }
    
    if let facilityId = self.facilityId {
        dictionary["facilityId"] = facilityId
    }
    
    if let surgeonPhysicianId = self.surgeonPhysicianId {
        dictionary["surgeonPhysicianId"] = surgeonPhysicianId
    }
    
    if let hcrId = self.hcrId {
        dictionary["hcrId"] = hcrId
    }
    
    if let teamId = self.teamId {
        dictionary["teamId"] = teamId
    }
    
    if let coverageId = self.coverageId {
        dictionary["coverageId"] = coverageId
    }
    
    if let procedureId = self.procedureId {
        dictionary["procedureId"] = procedureId
    }
    
    if let bodySide = self.bodySide {
        dictionary["bodySide"] = bodySide.rawValue
    }
    
    if let patientId = self.patientId {
        dictionary["patientId"] = patientId
    }
    
    dictionary["patientName"] = createPatientName().asDictionary()
    
    if let patientGender = self.patientGender {
        dictionary["patientGender"] = patientGender.rawValue
    }
    
    if let description = self.description {
        dictionary["description"] = description
    }
    
    if let splitImplantsInstruments = self.splitImplantsInstruments {
        dictionary["splitImplantsInstruments"] = splitImplantsInstruments
    }
    
    if let treatMixedAsImplants = self.treatMixedAsImplants {
        dictionary["treatMixedAsImplants"] = treatMixedAsImplants
    }
    
    if let implantLoanOrderId = self.implantLoanOrderId {
        dictionary["implantLoanOrderId"] = implantLoanOrderId
    }
    
    if let instrumentLoanOrderId = self.instrumentLoanOrderId {
        dictionary["instrumentLoanOrderId"] = instrumentLoanOrderId
    }
    
    if let implantLoanId = self.implantLoanId {
        dictionary["implantLoanId"] = implantLoanId
    }
    
    if let instrumentLoanId = self.instrumentLoanId {
        dictionary["instrumentLoanId"] = instrumentLoanId
    }
    
    if let cancelReason = self.cancelReason {
        dictionary["cancelReason"] = cancelReason.rawValue
    }
    
    if let cancelNote = self.cancelNote {
        dictionary["cancelNote"] = cancelNote
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

// PatientName

func createPatientName() -> PersonName {
    let patientName = PersonName()
    patientName.title = self.patientNameTitle
    patientName.givenName = self.patientNameGivenName
    patientName.middleName = self.patientNameMiddleName
    patientName.familyName = self.patientNameFamilyName
    patientName.suffix = self.patientNameSuffix
    patientName.fullName = self.patientNameFullName
    patientName.displayName = self.patientNameDisplayName
    patientName.locale = self.patientNameLocale
    return patientName
}

func applyPatientName(patientName: PersonName) {
    self.patientNameTitle = patientName.title
    self.patientNameGivenName = patientName.givenName
    self.patientNameMiddleName = patientName.middleName
    self.patientNameFamilyName = patientName.familyName
    self.patientNameSuffix = patientName.suffix
    self.patientNameFullName = patientName.fullName
    self.patientNameDisplayName = patientName.displayName
    self.patientNameLocale = patientName.locale
}
}
