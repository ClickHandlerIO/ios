import Foundation
import GRDBCipher

enum HcrType: String {
    case SERVICE_REP
    case SALES_REP
}

extension HcrType: DatabaseValueConvertible {
}
