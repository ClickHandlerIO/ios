import Foundation
import GRDBCipher

enum PhysicianType: String {
    case SURGEON
}

extension PhysicianType: DatabaseValueConvertible {
}
