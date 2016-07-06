import Foundation
import GRDBCipher

enum ComponentContainerType: String {
    case TRAY
    case TOTE
    case VIRTUAL
}

extension ComponentContainerType: DatabaseValueConvertible {
}
