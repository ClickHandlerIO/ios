//
// Created by Chris Jones on 7/18/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

class CreateCaseTvc: BaseFormController {
    var surgeonInput: FormControl?
    var something: String

    override init() {
        something = ""
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Init with coder not expected")
    }
}