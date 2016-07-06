import Foundation
import GRDBCipher

enum OrgType: String {
    case MED_DEVICE_COMPANY
    case HEALTH_SYSTEM
    case DISTRIBUTOR
    case PRACTICE
    case PARTNER
}

extension OrgType: DatabaseValueConvertible {
}
