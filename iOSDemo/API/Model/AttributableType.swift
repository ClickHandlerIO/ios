import Foundation
import GRDBCipher

enum AttributableType: String {
    case CASE_EVENT
    case LOAN
    case ORDER
    case ITEM
    case SHIPMENT
    case PACKAGE
    case ORG
    case BIZ_UNIT
    case ORG_UNIT
    case FACILITY
    case TEAM
    case PROCEDURE
    case AE
    case CONSUMER
    case DCE
    case HCR
    case PATIENT
    case PHYSICIAN
    case SYSTEM_ADMIN
    case USER
}

extension AttributableType: DatabaseValueConvertible {
}
