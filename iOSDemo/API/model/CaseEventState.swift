import Foundation
import GRDBCipher

enum CaseEventState: String {
    case IDLE
    case REQ_ITEMS_UPDATING
    case EVENT_UPDATING
    case CANCELLING
    case SCHEDULING_UPDATING
    case STATUS_UPDATING
    case USAGE_UPDATING
}

extension CaseEventState: DatabaseValueConvertible {
}
