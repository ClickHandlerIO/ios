import Foundation
import GRDBCipher

enum EventStatus: String {
    case OPEN
    case CLOSED
}

extension EventStatus: DatabaseValueConvertible {
}
