import Foundation
import GRDBCipher

enum TZ: String {
    case UTC
    case PST
    case AST
    case MST
    case CST
    case EST
}

extension TZ: DatabaseValueConvertible {
}
