//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class EventBus {

    static var eventDict: [String:[NSUUID:Any]] = [:]

    static func publish<E>(event: E) {
        var eventId = String(event.self)
        if (eventId.containsString(".")) {
            if let last = eventId.componentsSeparatedByString(".").last {
                eventId = last
            }
        }

        if let handlerDictionary = eventDict[eventId] {
            dispatch_async(dispatch_get_main_queue(), {
                for handler in handlerDictionary.values {
                    if let handlerAction = handler as? ((E) -> Void) {
                        handlerAction(event)
                    }
                }
            })
        }
    }

    static func subscribe<E:Any>(eventType: E.Type, _ handle: ((E) -> Void)) -> EventRegistration {
        let eventIdentifier = String(eventType)
        let reg = EventRegistration(eventIdentifier)

        var d = eventDict[eventIdentifier] ?? [:]
        d[reg.id] = handle
        eventDict[eventIdentifier] = d

        return reg
    }

    static func unsubscribe(r: EventRegistration) {
        eventDict[r.event]?.removeValueForKey(r.id)
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
