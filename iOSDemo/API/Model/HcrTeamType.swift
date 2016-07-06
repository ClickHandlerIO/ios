import Foundation
import GRDBCipher

enum HcrTeamType: String {
    case HCR
    case TEAM
}

extension HcrTeamType: DatabaseValueConvertible {
}
