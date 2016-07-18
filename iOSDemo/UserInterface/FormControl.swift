//
// Created by Chris Jones on 7/18/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

protocol FormControl {
    var disabled: Bool { get set }
    var cell: UITableViewCell { get }
    func onCellTouch(nav: UINavigationController) -> Void
}

protocol HasValue {
    associatedtype Value

    var value: Value { get }

    func setValue(value: Value)

    func setValue(value: Value, fireEvent: Bool)

    func onValueChange(value: Value) -> Void
}