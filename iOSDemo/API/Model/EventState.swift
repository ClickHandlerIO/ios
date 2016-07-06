import Foundation
import GRDBCipher

enum EventState: String {
    case IDLE
    case RESCHEDULING
    case CASE_UPDATING
    case CANCELLING
    case BUSY
}

extension EventState: DatabaseValueConvertible {
}
