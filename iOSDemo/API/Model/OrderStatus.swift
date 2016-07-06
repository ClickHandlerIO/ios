import Foundation
import GRDBCipher

enum OrderStatus: String {
    case PENDING
    case ACTIVE
    case QUEUED_FOR_ERP
    case SENDING_TO_ERP
    case ERP_CONFIRMED
    case ERP_ERROR
    case COMPLETED
    case CANCELED
    case CLOSED
}

extension OrderStatus: DatabaseValueConvertible {
}
