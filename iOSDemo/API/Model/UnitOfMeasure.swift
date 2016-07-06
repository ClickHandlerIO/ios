import Foundation
import GRDBCipher

enum UnitOfMeasure: String {
    case EACH
    case BOX
    case MULTIPE
}

extension UnitOfMeasure: DatabaseValueConvertible {
}
