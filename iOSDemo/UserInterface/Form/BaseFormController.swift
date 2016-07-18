//
// Created by Chris Jones on 7/18/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import UIKit

class BaseFormController: BaseTableViewController {
    var formSectionMap: [Int:FormSection] = [:]

    // Table View Methods

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return formSectionMap.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFormSection(section).controls.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getFormSection(section).title
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let formControl = getControl(indexPath) {
            return formControl.cell
        }
        print("Error: no form control for index path: " + String(indexPath.row) + ", " + String(indexPath.section) + "]")
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let formControl = getControl(indexPath), navController = self.navigationController {
            formControl.onCellTouch(navController)
        }
    }

    // Form Control Helpers

    func setSectionTitle(title: String, section: Int) {
        getFormSection(section).title = title
    }

    func registerControl(control: FormControl, section: Int = 0) {
        if let formSection = formSectionMap[section] {
            formSection.addControl(control)
        }
    }

    func getFormSection(section: Int) -> FormSection {
        if let formSection = formSectionMap[section] {
            return formSection;
        } else {
            var formSection = FormSection()
            formSectionMap[section] = formSection
            return formSection
        }
    }

    func getControl(indexPath: NSIndexPath?) -> FormControl? {
        guard let indexPath = indexPath else {
            return nil
        }
        return getFormSection(indexPath.section).controls[indexPath.row]
    }
}
