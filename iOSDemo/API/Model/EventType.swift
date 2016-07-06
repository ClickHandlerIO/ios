import Foundation
import GRDBCipher

enum EventType: String {
    case CASE
    case APPOINTMENT
}

extension EventType: DatabaseValueConvertible {
}
