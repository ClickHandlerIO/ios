import Foundation
import GRDBCipher

enum FacilityType: String {
    case MDC_FIELD_OFFICE
    case CLINIC
    case HOSPITAL
    case SURGERY_CENTER
    case SCAN_CENTER
    case DISTRIBUTION_CENTER
}

extension FacilityType: DatabaseValueConvertible {
}
