import Foundation
import GRDBCipher

enum HcpType: String {
    case NURSE
    case NURSE_PRACTITIONER
    case CNA
    case NURSE_ANAESTHETIST
}

extension HcpType: DatabaseValueConvertible {
}
