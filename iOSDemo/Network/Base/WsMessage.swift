//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON

class WsHeader: JSONSerializable {
    var method: Int = 0
    var id: Int = 0
    var code: Int = 0
    var type: String?

    required init() {
    }

    convenience required init(method: Int, id: Int, code: Int, type: String?) {
        self.init()

        self.method = method
        self.id = id
        self.code = code
        self.type = type
    }

    convenience required init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        self.init()

        self.method = json["m"].intValue
        self.id = json["i"].intValue
        self.code = json["c"].intValue
        self.type = json["t"].stringValue
    }

    func stringify() -> String {
        return asJSON().rawString()!
    }

    func asJSON() -> JSON {
        return JSON(asDictionary())
    }

    func asDictionary() -> [String:AnyObject] {
        return [
                "m": self.method,
                "i": self.id,
                "c": self.code,
                "t": self.type!
        ]
    }
}

class WsMessage {
    var header: WsHeader?
    var body: String?

    init() {
    }

    init(header: WsHeader?, body: String?) {
        self.header = header
        self.body = body
    }

    class func decode(message: String?) -> WsMessage? {
        guard let message = message else {
            return nil
        }

        guard !message.isEmpty else {
            return nil
        }

        var headerJson: String = ""
        var body: String = ""

        if message[message.startIndex] == Character("{") {
            headerJson = message
        } else {
            let headerIndex = message.characters.indexOf("{")
            if headerIndex == nil {
                return WsMessage()
            }

            let headerLengthStr = message.substringToIndex(headerIndex!)
            let headerLength = Int(headerLengthStr)

            if headerLength == nil {
                return WsMessage()
            }

            headerJson = message.substringWithRange(Range(headerIndex! ..< headerIndex!.advancedBy(headerLength!)))
            body = message.substringFromIndex(headerIndex!.advancedBy(headerLength!))
        }

        guard let header = WsHeader(json: headerJson.toJSON()) else {
            return nil
        }

        return WsMessage(header: header, body: body)
    }

    func encode() -> String? {
        guard let header = header else {
            return nil
        }

        let headerJson = header.stringify()
        guard !headerJson.isEmpty else {
            return nil
        }

        guard let body = body else {
            return headerJson
        }

        guard !body.isEmpty && body != "{}" else {
            return headerJson
        }

        return "\(headerJson.length)" + headerJson + body
    }
}

enum WsMethod: Int {
    case OUT = 0
    case IN = 1
    case SUB = 2
    case USUB = 3
    case PUSH = 4
    case PING = 5
    case PONG = 6
}

enum WsCode: Int {
    case SC_ACCEPTED = 202
    case SC_BAD_GATEWAY = 502
    case SC_BAD_REQUEST = 400
    case SC_CONFLICT = 409
    case SC_CONTINUE = 100
    case SC_CREATED = 201
    case SC_EXPECTATION_FAILED = 417
    case SC_FORBIDDEN = 403
    case SC_GATEWAY_TIMEOUT = 504
    case SC_GONE = 410
    case SC_HTTP_VERSION_NOT_SUPPORTED = 505
    case SC_INTERNAL_SERVER_ERROR = 500
    case SC_LENGTH_REQUIRED = 411
    case SC_METHOD_NOT_ALLOWED = 405
    case SC_MOVED_PERMANENTLY = 301
    case SC_MOVED_TEMPORARILY = 302
    case SC_MULTIPLE_CHOICES = 300
    case SC_NO_CONTENT = 204
    case SC_NON_AUTHORITATIVE_INFORMATION = 203
    case SC_NOT_ACCEPTABLE = 406
    case SC_NOT_FOUND = 404
    case SC_NOT_IMPLEMENTED = 501
    case SC_NOT_MODIFIED = 304
    case SC_OK = 200
    case SC_PARTIAL_CONTENT = 206
    case SC_PAYMENT_REQUIRED = 402
    case SC_PRECONDITION_FAILED = 412
    case SC_PROXY_AUTHENTICATION_REQUIRED = 407
    case SC_REQUEST_ENTITY_TOO_LARGE = 413
    case SC_REQUESTED_RANGE_NOT_SATISFIABLE = 416
    case SC_RESET_CONTENT = 205
    case SC_SEE_OTHER = 303
    case SC_SERVICE_UNAVAILABLE = 503
    case SC_SWITCHING_PROTOCOLS = 101
    case SC_TEMPORARY_REDIRECT = 307
    case SC_UNAUTHORIZED = 401
    case SC_UNSUPPORTED_MEDIA_TYPE = 415
    case SC_USE_PROXY = 305
}