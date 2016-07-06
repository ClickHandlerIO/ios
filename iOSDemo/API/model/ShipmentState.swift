import Foundation
import GRDBCipher

enum ShipmentState: String {
    case IDLE
    case PARENT_UPDATING
    case BUSY
}

extension ShipmentState: DatabaseValueConvertible {
}
