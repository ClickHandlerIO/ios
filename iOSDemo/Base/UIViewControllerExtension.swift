//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import UIKit

extension UIViewController {
    func dispatch<Request, Response, Action:ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, _ action: Action.Type, _ callback: ((Response) -> (Void))?) -> NSOperation {
        return ActionDispatcher.instance.queue(request, action, callback)
    }
}