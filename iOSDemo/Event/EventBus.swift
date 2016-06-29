//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class EventBus {

    static var eventRegistration: [String:[NSUUID:((Any) -> Void)]] = [:]

    static func publish(event: Any) {
        var er = eventRegistration
        var eventId = String(event.self)
        if (eventId.containsString(".")) {
            if let last = eventId.componentsSeparatedByString(".").last {
                eventId = last
            }
        }
        if let handlerDictionary = eventRegistration[eventId] {
            dispatch_async(dispatch_get_main_queue(), {
                for handler in handlerDictionary.values {
                    handler(event)
                }
            })
        }
    }

    static func subscribe<E>(eventType: E.Type, _ handle: ((Any) -> Void)) -> EventRegistration {
        let eventIdentifier = String(eventType)
        let newRegistration = EventRegistration(eventIdentifier)

        var d = eventRegistration[eventIdentifier] ?? [:]
        d[newRegistration.id] = handle //as! ((Any) -> Void)
        eventRegistration[eventIdentifier] = d
        return newRegistration
    }

    static func unsubscribe(r: EventRegistration) {
        eventRegistration[r.event]?.removeValueForKey(r.id)
    }
}

struct EventRegistration {
    var event: String
    var id: NSUUID

    init(_ event: String) {
        self.event = event
        self.id = NSUUID()
    }

    func unsubscribe() {
        EventBus.unsubscribe(self)
    }
}
