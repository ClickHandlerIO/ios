import Foundation
import GRDBCipher

enum ShipmentStatus: String {
    case BUILDING
    case RELEASED
    case SHIPPING
    case IN_TRANSIT
    case DELIVERED
    case VERIFIED
    case STOCKED
}

extension ShipmentStatus: DatabaseValueConvertible {
}
