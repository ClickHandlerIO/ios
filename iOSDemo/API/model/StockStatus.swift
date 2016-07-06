import Foundation
import GRDBCipher

enum StockStatus: String {
    case AVAILABLE
    case UNAVAILABLE
    case HOLD
    case ALLOCATED
    case LOST
    case FOUND
}

extension StockStatus: DatabaseValueConvertible {
}
