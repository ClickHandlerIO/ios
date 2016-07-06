import Foundation
import GRDBCipher

enum DirectoryNonPersonType: String {
    case ORG_UNIT
    case FACILITY
}

extension DirectoryNonPersonType: DatabaseValueConvertible {
}
