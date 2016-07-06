import Foundation
import GRDBCipher

enum ItemType: String {
    case PIECE
    case SET
    case TRAY
    case KIT
}

extension ItemType: DatabaseValueConvertible {
}
