import Foundation
import GRDBCipher

enum CaseLoaningMethodology: String {
    case LOAN_PER_CASE
    case LOAN_PER_DAY
}

extension CaseLoaningMethodology: DatabaseValueConvertible {
}
