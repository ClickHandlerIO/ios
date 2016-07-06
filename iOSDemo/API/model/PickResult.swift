import Foundation
import GRDBCipher

enum PickResult: String {
    case PICK_ID_REQUIRED
    case STOCK_ID_REQUIRED
    case STOCK_UNAVAILABLE
    case ITEMS_NOT_SAME
    case FAILED
    case LOT_SERIAL_SWAP_NOT_ALLOWED
    case VERSION_SWAP_NOT_ALLOWED
    case STOCK_NOT_FOUND
    case INVALID_PICK_TYPE
    case OUTCOME_REQUIRED
    case KIT_INVALID
    case TRAY_INVALID
    case TO_CONTAINER_TYPE_REQUIRED
    case TO_CONTAINER_ID_REQUIRED
    case PICK_NOT_FOUND
    case ITEM_NOT_FOUND
    case SUCCESS
}

extension PickResult: DatabaseValueConvertible {
}
