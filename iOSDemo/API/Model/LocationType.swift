import Foundation
import GRDBCipher

enum LocationType: String {
    case FACILITY
    case HCR
    case TEAM
    case IN_TRANSIT
}

extension LocationType: DatabaseValueConvertible {
}
