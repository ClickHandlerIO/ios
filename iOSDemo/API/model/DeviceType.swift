import Foundation
import GRDBCipher

enum DeviceType: String {
    case IOS_PHONE
    case IOS_PAD
    case IOS_POD
    case ANDROID_PHONE
    case ANDROID_PAD
    case WEB_BROWSER
}

extension DeviceType: DatabaseValueConvertible {
}
