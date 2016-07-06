import Foundation
import GRDBCipher

enum StockSortBy: String {
    case BIZ_UNIT
    case INVENTORY_TYPE
    case ITEM_NUMBER
    case ITEM_LONG_DESC
    case ITEM_SHORT_DESC
    case ITEM_VERSION
    case SERIAL_NUMBER
    case LOT_NUMBER
    case HOME_LOCATION
    case LOCATION
    case FROM_LOCATION
    case TO_LOCATION
    case DUE_BACK_LOCATION
    case STOCK_STATUS
}

extension StockSortBy: DatabaseValueConvertible {
}
