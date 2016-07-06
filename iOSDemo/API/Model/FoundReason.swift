import Foundation
import GRDBCipher

enum FoundReason: String {
    case VERIFY
    case CYCLE_COUNT
}

extension FoundReason: DatabaseValueConvertible {
}
