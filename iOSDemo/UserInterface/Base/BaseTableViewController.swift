//
// Created by Chris Jones on 6/29/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController : BaseViewController, UITableViewDataSource, UITableViewDelegate {

    // TODO tvc

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
