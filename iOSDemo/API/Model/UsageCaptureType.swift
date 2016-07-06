import Foundation
import GRDBCipher

enum UsageCaptureType: String {
    case WEB_MANUAL_ENTRY
    case WEB_BARCODE
    case IOS_MANUAL_ENTRY
    case IOS_LINEA_PRO
    case IOS_CAMERA
}

extension UsageCaptureType: DatabaseValueConvertible {
}
