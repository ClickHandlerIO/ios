import Foundation
import GRDBCipher

enum StockContainerType: String {
    case BIN
    case KIT
    case TRAY
    case TOTE
    case VIRTUAL_TOTE
    case PACKAGE
    case LOAN
}

extension StockContainerType: DatabaseValueConvertible {
}
