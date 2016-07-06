import Foundation
import GRDBCipher

enum PersonType: String {
    case AE
    case HCR
    case HCP
}

extension PersonType: DatabaseValueConvertible {
}
