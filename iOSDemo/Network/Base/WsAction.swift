//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol WsRequest: JSONSerializable {
    associatedtype Response: JSONSerializable

    static func getPath() -> String

    static func isQueueable() -> Bool
}