import Foundation
import GRDBCipher

enum LostReason: String {
    case VERIFY
    case PICK
    case CYCLE_COUNT
}

extension LostReason: DatabaseValueConvertible {
}
