import Foundation
import GRDBCipher

enum CaseEventStatus: String {
    case PLANNING
    case PREPARING
    case READY
    case IN_PROGRESS
    case POSTOP
    case COMPLETE
    case CANCELLED
}

extension CaseEventStatus: DatabaseValueConvertible {
}
