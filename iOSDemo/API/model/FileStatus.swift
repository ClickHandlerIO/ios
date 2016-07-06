import Foundation
import GRDBCipher

enum FileStatus: String {
    case PENDING
    case UPLOADING
    case COMPLETE
    case FAILED
    case CANCELLED
}

extension FileStatus: DatabaseValueConvertible {
}
