import Foundation
import GRDBCipher

enum ContactType: String {
    case SYSTEM_ADMIN
    case HEALTH_SYSTEM
    case HS_FACILITY
    case HS_BIZ_UNIT
    case HS_ORG_UNIT
    case HS_AE
    case HS_HCP
    case HS_HCR
    case DISTRIBUTOR
    case DIST_FACILITY
    case DIST_BIZ_UNIT
    case DIST_ORG_UNIT
    case DIST_AE
    case DIST_HCP
    case DIST_HCR
    case MED_DEVICE_COMPANY
    case MDC_FACILITY
    case MDC_BIZ_UNIT
    case MDC_ORG_UNIT
    case MDC_AE
    case MDC_HCP
    case MDC_HCR
    case MDC_DCE
    case PRACTICE
    case PRACTICE_BIZ_UNIT
    case PRACTICE_ORG_UNIT
    case PRACTICE_FACILITY
    case PRACTICE_AE
    case PRACTICE_HCP
    case PARTNER
    case PARTNER_BIZ_UNIT
    case PARTNER_ORG_UNIT
    case PARTNER_FACILITY
    case PARTNER_AE
    case PARTNER_HCP
    case PHYSICIAN
    case EXTERNAL
}

extension ContactType: DatabaseValueConvertible {
}
