import Foundation
import GRDBCipher

enum BarcodeType: String {
    case EAN
    case GTIN
    case HIBC
}

extension BarcodeType: DatabaseValueConvertible {
}
