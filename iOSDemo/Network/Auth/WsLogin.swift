//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WsLogin {

    class Request: WsRequest {
        typealias Response = WsLogin.Response

        var email: String?
        var password: String?

        class func getPath() -> String {
            return "/auth/login"
        }

        class func isQueueable() -> Bool {
            return false
        }

        public required init() {
        }

        public convenience required init?(json: JSON?) {
            guard let json = json else {
                return nil
            }
            self.init()
            self.merge(json)
        }

        public func merge(json: JSON?) {
            guard let json = json else {
                return
            }

            if let email = json["email"].string {
                self.email = email
            }

            if let password = json["password"].string {
                self.password = password
            }
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

    class Response: JSONSerializable {
        var code: WsLogin.Response.Code = .FAILED
        var sessionId: String?
        var user: User?
        var logLevel: String?

        enum Code: String {
            case SUCCESS
            case FAILED
            case EMAIL_OR_PASSWORD_NOT_SET
            case USER_NOT_FOUND
            case USER_INACTIVE
            case PASSWORD_FAILED
        }

        public required init() {
        }

        public convenience required init?(json: JSON?) {
            guard let json = json else {
                return nil
            }
            self.init()
            self.merge(json)
        }

        public func merge(json: JSON?) {
            guard let json = json else {
                return
            }

            if let codeRaw = json["code"].string {
                if let code = WsLogin.Response.Code(rawValue: codeRaw) {
                    self.code = code
                }
            }

            if let sessionId = json["sessionId"].string {
                self.sessionId = sessionId
            }

            self.user = User(json: json["user"])

            if let logLevel = json["logLevel"].string {
                self.logLevel = logLevel
            }
        }

        func asDictionary() -> [String:AnyObject] {
            var dictionary = [String: AnyObject]()
            dictionary["code"] = code.rawValue

            if let sessionId = self.sessionId {
                dictionary["sessionId"] = sessionId
            }

            if let user = self.user {
                dictionary["user"] = user.asDictionary()
            }

            if let logLevel = self.logLevel {
                dictionary["logLevel"] = logLevel
            }

            return dictionary
        }
    }

}



