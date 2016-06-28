////
//// Created by Chris Jones on 6/24/16.
//// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
////
//
//import Foundation
//
//class ActionBase<REQ, RESP> {
//    var request: REQ?
//
//    func actionType() -> ActionType {
//        preconditionFailure("This method must be overridden")
//    }
//
//    func run(request: REQ) -> RESP {
//        preconditionFailure("This method must be overridden")
//    }
//}
//
//class LoginAction: ActionBase<Request, Response> {
//
//    override func actionType() -> ActionType {
//        return .General
//    }
//
//    override func run(request: Request) -> Response {
//        // do work here
//        return Response()
//    }
//}
//
//public struct Request {
//    var username: String?
//    var password: String?
//}
//
//public struct Response {
//    var code: String?
//}
//
//
//class BaseDbAction<REQ, RESP>: ActionBase<REQ, RESP> {
//
//    func getDbConn() -> AnyObject {
//        preconditionFailure("This method must be overridden")
//    }
//
//    func run(request: REQ) {
//        run(request, conn: "")
//    }
//
//    func run(request: REQ, conn: AnyObject) {
//        preconditionFailure("This method must be overridden")
//    }
//}
//
//class WriteDbAction<REQ, RESP>: BaseDbAction<REQ, RESP> {
//    override func getDbConn() -> AnyObject {
//        return ""// TODO
//    }
//}
//
//class ReadUncommittedDbAction<REQ, RESP>: BaseDbAction<REQ, RESP> {
//    override func getDbConn() -> AnyObject {
//        return "" // TODO
//    }
//}