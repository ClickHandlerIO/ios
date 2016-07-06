import Foundation
import GRDBCipher

enum Gender: String {
    case MALE
    case FEMALE
    case UNKNOWN
}

extension Gender: DatabaseValueConvertible {
}
