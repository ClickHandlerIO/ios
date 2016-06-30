//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol WsRequest: JSONSerializable {
    associatedtype Response: AnyObject

    static func getPath() -> String

    static func isQueueable() -> Bool
}

class LoginRequest: WsRequest {
    typealias Response = LoginResponse

    var email: String? = nil
    var password: String? = nil

    class func getPath() -> String {
        return "/auth/login"
    }

    class func isQueueable() -> Bool {
        return false
    }

    public required init() {}

    public convenience required init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        self.init()
        // todo handle json
//        self.merge(json)
    }

    func asDictionary() -> [String:AnyObject] {
        var dictionary = [String: AnyObject]()

        if let email = self.email {
            dictionary["email"] = email
        }

        if let password = self.password {
            dictionary["password"] = password
        }

        return dictionary
    }
}

class LoginResponse: JSONSerializable {
    var code: String?

    public required init() {}

    public convenience required init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        self.init()
        // todo handle json
//        self.merge(json)
    }

    func asDictionary() -> [String:AnyObject] {
        var dictionary = [String: AnyObject]()

        if let code = self.code {
            dictionary["code"] = code
        }

        return dictionary
    }
}