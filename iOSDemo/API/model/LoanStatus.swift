import Foundation
import GRDBCipher

enum LoanStatus: String {
    case PLANNING
    case ACTIVE
    case INACTIVE
}

extension LoanStatus: DatabaseValueConvertible {
}
