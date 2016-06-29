//
// Created by Chris Jones on 6/28/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import GRDBCipher

enum BodySide: String {
    case LEFT
    case RIGHT
    case BILATERAL
    case FAR_LATERAL
    case UNKNOWN
}

extension BodySide: DatabaseValueConvertible {

}