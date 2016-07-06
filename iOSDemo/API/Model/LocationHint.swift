import Foundation
import GRDBCipher

enum LocationHint: String {
    case LOAN
    case CONSIGNMENT
    case HCR
    case FACILITY
}

extension LocationHint: DatabaseValueConvertible {
}
