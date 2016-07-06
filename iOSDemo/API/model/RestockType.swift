import Foundation
import GRDBCipher

enum RestockType: String {
    case ON_USAGE
    case PAR
}

extension RestockType: DatabaseValueConvertible {
}
