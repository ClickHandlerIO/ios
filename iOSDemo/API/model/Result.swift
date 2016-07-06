import Foundation
import GRDBCipher

enum Result: String {
    case STOCK_CREATED
    case ITEM_NUMBER_REQUIRED
    case ITEM_NOT_FOUND
    case LOT_NOT_FOUND
    case SERIAL_NOT_FOUND
    case FAILED
    case EXPIRED
}

extension Result: DatabaseValueConvertible {
}
