//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import Locksmith

class SessionManager {
    static let instance = SessionManager()
    static let userKey = "USER"
    static let passwordKey = "PASSWORD"
    static let keychainAccount = "MoveMedical"

    var _loggedIn: Bool
    var user: User?

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

    func loginSuccessful(user: User, password: String) {
        // Save last logged in user to keychain
        do {
            try Locksmith.saveData([SessionManager.userKey: user.stringify(), SessionManager.passwordKey: password], forUserAccount: SessionManager.keychainAccount)
        } catch {
            print("Failed to save last logged in user info to keychain")
        }

        self.user = user
        self.loggedIn = true
    }

    func logout() {
        self.user = nil
        self.loggedIn = false
    }

    func getLastLoggedInCredentials() -> (user:User, password:String)? {
        guard let dict = Locksmith.loadDataForUserAccount(SessionManager.keychainAccount) else {
            return nil
        }

        if let user = dict[SessionManager.userKey] as? String, let password = dict[SessionManager.passwordKey] as? String {
            if let user = User(json: user.toJSON()) {
                return (user: user, password: password)
            }
        }

        return nil
    }


    // todo other user prefs/info from logging in
}
