import Foundation
import GRDBCipher

enum Outcome: String {
    case PICKED
    case DAMAGED
    case NOT_FOUND
}

extension Outcome: DatabaseValueConvertible {
}
