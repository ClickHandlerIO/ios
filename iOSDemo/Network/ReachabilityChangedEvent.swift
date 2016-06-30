//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation

class ReachabilityChangedEvent {
    var reachable: Bool
    var reachableViaWifi: Bool
    var reachableViaCellular: Bool

    init(reachable: Bool, reachableViaWifi: Bool) {
        self.reachable = reachable
        self.reachableViaWifi = reachableViaWifi
        self.reachableViaCellular = reachable && !reachableViaWifi
    }
}
