import Foundation
import GRDBCipher

enum CaseUsageDisposition: String {
    case IMPLANTED
    case DAMAGED
    case WASTED
}

extension CaseUsageDisposition: DatabaseValueConvertible {
}
