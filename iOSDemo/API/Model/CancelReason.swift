import Foundation
import GRDBCipher

enum CancelReason: String {
    case SURGERY_CANCELLED
    case DUPLICATE_CASE
    case TO_BE_RESCHEDULED
    case OTHER
}

extension CancelReason: DatabaseValueConvertible {
}
