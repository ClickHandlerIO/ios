//
// Created by Chris Jones on 7/18/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

class FormSection {
    var title: String?
    var controls: [FormControl] = []

    func addControl(control: FormControl) {
        controls.append(control)
    }
}
