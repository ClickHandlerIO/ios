import Foundation
import GRDBCipher

enum PackageStatus: String {
    case EMPTY
    case BUILDING
    case SHIPPING
    case IN_TRANSIT
    case DELIVERED
    case VERIFIED
    case STOCKED
}

extension PackageStatus: DatabaseValueConvertible {
}
