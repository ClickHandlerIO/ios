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

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if (DatabaseManager.instance.connect()) {
            dispatch(SchemaAction.Request(), SchemaAction.self, nil)
            dispatch(WriteAction.Request(), WriteAction.self, nil)
            dispatch(ListAction.Request("search text"), ListAction.self) {
                (response: ListAction.Response) in
                switch response.code {
                case .SUCCESS:
                    print("success")
                case .FAILED:
                    print("failure")
                default:
                    print("default here")
                }

                if let datas = response.data {
                    for s in datas {
                        print(s.name, s.bodySide)
                    }
                }
            }

        }
    }

}

