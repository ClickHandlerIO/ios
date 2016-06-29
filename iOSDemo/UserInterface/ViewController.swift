//
//  ViewController.swift
//  iOSDemo
//
//  Created by Chris Jones on 6/24/16.
//  Copyright © 2016 ClickHandlerIO. All rights reserved.
//

import UIKit
import GRDBCipher

class ViewController: UIViewController {
    var fetchOp: NSOperation?

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if (DatabaseManager.instance.open()) {
            dispatch(SchemaAction.Request(), SchemaAction.self, nil)
            dispatch(WriteAction.Request(), WriteAction.self, nil)
            loadData()
        }
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let op = fetchOp {
            op.cancel()
        }
    }

    func loadData() {
        fetchOp = dispatch(ListAction.Request("search text"), ListAction.self) {
            (response: ListAction.Response) in
            print(response.code)
            if let datas = response.data {
                for s in datas {
                    print(s.name, s.bodySide)
                }
            }
        }
    }

}

