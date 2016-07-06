import Foundation
import GRDBCipher

enum UserStatus: String {
    case ACTIVE
    case PENDING
    case INACTIVE
}

extension UserStatus: DatabaseValueConvertible {
}
