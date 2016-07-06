import Foundation
import GRDBCipher

enum BodySide: String {
    case LEFT
    case RIGHT
    case BILATERAL
    case FAR_LATERAL
    case UNKNOWN
}

extension BodySide: DatabaseValueConvertible {
}
