import Foundation
import GRDBCipher

enum UserPerspective: String {
    case ADMIN
    case SYSTEM_ADMIN
    case HEALTH_SYSTEM_AE
    case HEALTH_SYSTEM_HCP
    case HEALTH_SYSTEM_HCR
    case MED_DEVICE_COMPANY_AE
    case MED_DEVICE_COMPANY_HCP
    case MED_DEVICE_COMPANY_HCR
    case MED_DEVICE_COMPANY_DCE
    case DISTRIBUTOR_AE
    case DISTRIBUTOR_HCR
    case DISTRIBUTOR_HCP
    case PRACTICE_AE
    case PRACTICE_HCR
    case PRACTICE_HCP
    case PARTNER_AE
    case PARTNER_HCP
    case PARTNER_HCR
    case CONSUMER
}

extension UserPerspective: DatabaseValueConvertible {
}
