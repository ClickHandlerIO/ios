//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class ActionDispatcher {
    static let instance = ActionDispatcher()

    lazy var generalQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "General Queue"
        return queue
    }()

    lazy var DbWriteQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "DB Write Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    lazy var DbReadUncommittedQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "DB Read Uncommitted Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    private init() {
    }

    func queue<Request, Response, Action: ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, _ action: Action.Type, _ callback: ((Response) -> (Void))?) {
        // todo queue in nsoperation
        let response = action.run(request, NSOperation())
        if let callback = callback {
            callback(response)
        }
    }
}

class ActionOperation: NSOperation {

    override func main() {
        if self.cancelled {
            return
        }

        // todo run

        // todo do work and return it
    }
}
