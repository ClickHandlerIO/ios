import Foundation
import GRDBCipher

enum CycleCountStatus: String {
    case PENDING
    case IN_PROGRESS
    case RECONCILING
    case COMPLETE
}

extension CycleCountStatus: DatabaseValueConvertible {
}
