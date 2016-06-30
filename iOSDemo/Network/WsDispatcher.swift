//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import ReachabilitySwift

class WsDispatcher {
    static let instance = WsDispatcher()
    static let apiURL = "wss://devapi.movemedical.com/v1"
    var reachability: Reachability?

    init() {
    }

    // Reachability

    func startMonitoringReachability() {
        do {
            reachability = try Reachability.reachabilityForInternetConnection() // try Reachability(hostname: WsDispatcher.apiURL) // todo use diff URL for server to see if API is reachable
        } catch {
            print("Could not create Reachability")
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onReachabilityChanged(_:)), name: ReachabilityChangedNotification, object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            print("Could not start reachability notifier")
        }
    }

    func stopMonitoringReachability() {
        reachability?.stopNotifier()
        NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: reachability)
    }

    @objc func onReachabilityChanged(n: NSNotification) {
        if let r = reachability {
            EventBus.publish(ReachabilityChangedEvent(reachable: r.isReachable(), reachableViaWifi: r.isReachableViaWiFi()))
            print("reachable", r.isReachable(), r.isReachableViaWiFi(), r.isReachableViaWWAN())
        }
    }
}
