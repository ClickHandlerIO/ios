import Foundation
import GRDBCipher

enum ConversationParticipantType: String {
    case PERSON
    case EXTERNAL
    case ORG_UNIT
    case FACILITY
}

extension ConversationParticipantType: DatabaseValueConvertible {
}
