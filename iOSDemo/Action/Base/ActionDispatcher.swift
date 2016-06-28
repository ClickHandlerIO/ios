//
// Created by Chris Jones on 6/24/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class ActionDispatcher {
    static let instance = ActionDispatcher()

    lazy var generalQueue: NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "General Queue"
        return queue
    }()

    lazy var dbWriteQueue: NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "DB Write Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    lazy var dbReadUncommittedQueue: NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "DB Read Uncommitted Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    private init() {
    }

    func queue<Request, Response, Action:ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, _ action: Action.Type, _ callback: ((Response) -> (Void))?) -> NSOperation {
        var operation = ActionOperation<Response>({
            op in
            action.run(request, operation: op)
        }, callback)

        switch action.actionType() {
        case .General:
            generalQueue.addOperation(operation)
        case .DatabaseWrite:
            dbWriteQueue.addOperation(operation)
        case .DatabaseReadUncommitted:
            dbReadUncommittedQueue.addOperation(operation)
        }
        return operation
    }
}

class ActionOperation<Response>: NSOperation {
    var run: (operation:NSOperation) -> Response
    var callback: ((Response) -> Void)?

    init(_ run: ((operation:NSOperation) -> Response), _ callback: ((Response) -> Void)?) {
        self.run = run
        self.callback = callback
    }

    override func main() {
        if self.cancelled {
            return
        }

        var response = run(operation: self)

        if self.cancelled {
            return
        }

        if let c = callback {
            dispatch_async(dispatch_get_main_queue(), {
                c(response)
            })
        }
    }

}