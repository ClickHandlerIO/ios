//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class SessionManager {
    static let instance = SessionManager()

    var _loggedIn: Bool
    var currentUser: AnyObject?
    // todo

    init() {
        _loggedIn = false;
    }

    var loggedIn: Bool {
        get {
            return _loggedIn
        }
        set(newValue) {
            _loggedIn = newValue
            EventBus.publish(SessionStatusChangedEvent(_loggedIn))
        }
    }

    // todo other user prefs/info from logging in
}
