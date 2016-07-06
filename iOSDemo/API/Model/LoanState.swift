import Foundation
import GRDBCipher

enum LoanState: String {
    case IDLE
    case PARENT_UPDATING
    case BUSY
}

extension LoanState: DatabaseValueConvertible {
}
