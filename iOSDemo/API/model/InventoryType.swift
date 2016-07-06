import Foundation
import GRDBCipher

enum InventoryType: String {
    case LOAN
    case CONSIGN
}

extension InventoryType: DatabaseValueConvertible {
}
