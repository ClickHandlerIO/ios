//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class ActionDispatcher {
    static let instance = ActionDispatcher()

    private init() {
    }

    func queue<Request, Response, Action: ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, _ action: Action.Type, _ callback: ((Response) -> (Void))?) {
        // todo queue in nsoperation
        let response = action.run(request)
        if let callback = callback {
            callback(response)
        }
    }
}
