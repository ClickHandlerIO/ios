import Foundation
import GRDBCipher

enum CaseEventOpsStatus: String {
    case REQUESTING
    case SOURCING
    case PICKING
    case SHIPPING
    case SHIPPED_OUT
    case DELIVERED
    case VERIFIED
    case PICKUP
    case SHIPPED_BACK
    case RECEIVED
    case RETURNED
}

extension CaseEventOpsStatus: DatabaseValueConvertible {
}
