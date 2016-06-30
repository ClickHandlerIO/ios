//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class SessionStatusChangedEvent {
    var loggedIn: Bool

    init(_ loggedIn: Bool) {
        self.loggedIn = loggedIn
    }
}
