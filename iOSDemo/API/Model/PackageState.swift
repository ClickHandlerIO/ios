import Foundation
import GRDBCipher

enum PackageState: String {
    case IDLE
    case VERIFYING
    case BUSY
}

extension PackageState: DatabaseValueConvertible {
}
