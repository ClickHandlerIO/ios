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
        let operation = ActionOperation<Response>({
            op in
            action.run(request, operation: op, onCompletion: {
                response in
                if let c = callback {
                    dispatch_async(dispatch_get_main_queue(), {
                        c(response)
                    })
                }
            })
        })

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
    var run: (NSOperation) -> Void

    init(_ run: ((operation:NSOperation) -> Void)) {
        self.run = run
    }

    override func main() {
        if self.cancelled {
            return
        }
        run(self)
    }

}
