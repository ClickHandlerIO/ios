import Foundation
import GRDBCipher

enum Visibility: String {
    case ORG_UNIT
    case ORG
    case PUBLIC
}

extension Visibility: DatabaseValueConvertible {
}
