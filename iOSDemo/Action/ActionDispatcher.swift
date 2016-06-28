//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class ActionDispatcher {
    static let instance = ActionDispatcher()

    private init() {
    }

    func queue<Request, Response, Action: ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, action: Action.Type) {
        // todo queue in nsoperation
        let response = action.run(request)
//        if let callback = callback {
//            callback(response)
//        }
    }

//    func queue<Request, Response, Action: ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, action: Action.Type, callback: ((Response) -> (Void))?) {
//         todo queue in nsoperation
//        let response = action.run(request)
//        if let callback = callback {
//            callback(response)
//        }
//    }

    /*func queueRequest<ACTION where ACTION: Action>(request: AnyObject, action: ACTION, callback: ((AnyObject) -> (Void))?) {
//        let response = action.run(request)
//        if let c = callback {
//            c("")
//        }
    }*/


    /*func queueRequest<RESP>(request: ActionRequestBase, callback: (RESP -> ())?) {

        // todo create operation and queue the op (return the NSOp so it can be cancelled by ui)

        // as if running in the operation



//        let response = request.getAction().run(request)
//        let callback = callback {
//            callback(response)
//        }
    }*/
}
