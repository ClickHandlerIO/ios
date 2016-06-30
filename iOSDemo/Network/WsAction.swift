//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol WsRequest: AnyObject {
    associatedtype Response: AnyObject

    static func getPath() -> String

    static func isQueueable() -> Bool
}

class LoginRequest: WsRequest {
    typealias Response = LoginResponse

    class func getPath() -> String {
        return "/auth/login"
    }

    class func isQueueable() -> Bool {
        return false
    }

    var email: String? = nil
    var password: String? = nil
}

class LoginResponse {
    var code: String?
}