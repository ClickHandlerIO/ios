//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    init() {
        super.init(nibName:nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Init with coder not expected")
    }


    // Lifecycle

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        cancelAllPendingOperations()
        unsubscribeFromAllEvents()
    }

    // Action Dispatcher

    var actionOperations: [String:NSOperation] = [:]

    func dispatch<Request, Response, Action:ActionProtocol where Action.Request == Request, Action.Response == Response>(request: Request, _ action: Action.Type, _ callback: ((Response) -> (Void))?) {
        let op = ActionDispatcher.instance.queue(request, action, callback)
        let key = String(action)
        if let existingOp = actionOperations[key] {
            existingOp.cancel()
        }
        actionOperations[key] = op
    }

    func cancelAllPendingOperations() {
        for op in actionOperations.values {
            op.cancel()
        }
        actionOperations.removeAll()
    }

    // Event Bus

    var eventRegistrations: [EventRegistration] = []

    func subscribe<E:Any>(eventType: E.Type, _ handle: ((E) -> Void)) {
        eventRegistrations.append(EventBus.subscribe(eventType, handle))
    }

    func publish<E>(event: E) {
        EventBus.publish(event)
    }

    func unsubscribeFromAllEvents() {
        for r in eventRegistrations {
            r.unsubscribe()
        }
    }
}
