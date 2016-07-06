import Foundation
import GRDBCipher

enum StockState: String {
    case IDLE
    case PARENT_UPDATING
    case VERIFYING
    case BUSY
}

extension StockState: DatabaseValueConvertible {
}
