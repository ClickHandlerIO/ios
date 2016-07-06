import Foundation
import GRDBCipher

enum AvailablePerspective: String {
    case BOTH
    case PROFESSIONAL
    case PERSONAL
}

extension AvailablePerspective: DatabaseValueConvertible {
}
