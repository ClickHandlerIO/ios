//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class WsConnectivityChangedEvent {
    var connected: Bool

    init(_ connected: Bool) {
        self.connected = connected
    }
}
