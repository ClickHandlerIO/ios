import Foundation
import GRDBCipher

enum PatientType: String {
    case SELF
    case DEPENDENT
}

extension PatientType: DatabaseValueConvertible {
}
