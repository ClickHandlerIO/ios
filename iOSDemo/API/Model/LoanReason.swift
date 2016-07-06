import Foundation
import GRDBCipher

enum LoanReason: String {
    case CASE_EVENT
    case CONSIGN
    case MULTI_CASE_EVENT
}

extension LoanReason: DatabaseValueConvertible {
}
