import Foundation
import GRDBCipher

enum OrderState: String {
    case IDLE
    case PARENT_UPDATING
}

extension OrderState: DatabaseValueConvertible {
}
