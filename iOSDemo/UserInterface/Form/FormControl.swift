//
// Created by Chris Jones on 7/18/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

protocol FormControl {
    var cell: UITableViewCell { get }

    func onCellTouch(nav: UINavigationController) -> Void

    var disabled: Bool { get }

    mutating func setDisabled(disabled: Bool)

    mutating func setDisabled(disabled: Bool, fireEvent: Bool)

    var onDisabledChange: ((Bool) -> Void)? { get set }
}

extension FormControl {

    mutating func setDisabled(disabled: Bool) {
        setDisabled(disabled, fireEvent: true)
    }

    func fireDisabledChangeEvent(fireEvent: Bool) {
        if fireEvent {
            if let onDisabledChange = self.onDisabledChange {
                onDisabledChange(self.disabled)
            }
        }
    }
}

protocol HasValue {
    associatedtype Value

    var value: Value { get }

    mutating func setValue(value: Value)

    mutating func setValue(value: Value, fireEvent: Bool)

    var onValueChange: ((Value) -> Void)? { get set }
}

extension HasValue {
    mutating func setValue(value: Value) {
        setValue(value, fireEvent: true)
    }

    func fireValueChangeEvent(fireEvent: Bool) {
        if fireEvent {
            if let onValueChange = self.onValueChange {
                onValueChange(self.value)
            }
        }
    }
}