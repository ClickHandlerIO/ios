import Foundation
import GRDBCipher

enum ItemClass: String {
    case IMPLANT
    case INSTRUMENT
    case MIXED
}

extension ItemClass: DatabaseValueConvertible {
}
