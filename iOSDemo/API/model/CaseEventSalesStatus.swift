import Foundation
import GRDBCipher

enum CaseEventSalesStatus: String {
    case SCHEDULING
    case REQUESTING
    case AWAITING_SURGERY
    case BILLING
    case PENDING_PO
    case INVOICING
    case INVOICED
}

extension CaseEventSalesStatus: DatabaseValueConvertible {
}
