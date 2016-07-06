import Foundation
import GRDBCipher

enum OrderReasonGroup: String {
    case LOAN
    case LOAN_RETURN
    case STOCK
    case SALES
    case RETURN
}

extension OrderReasonGroup: DatabaseValueConvertible {
}
