//
//  ViewController.swift
//  iOSDemo
//
//  Created by Chris Jones on 6/24/16.
//  Copyright © 2016 ClickHandlerIO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var req = LoginAction.Request()
        req.username = "me"
        req.password = "passme"

        ActionDispatcher.instance.queue(req, LoginAction.self, {
            response in
            print("response here!", response)
        })

        var listReq = ListAction.REQUEST()
        listReq.search = "searching..."
        ActionDispatcher.instance.queue(listReq, ListAction.self, {
            response in
            print("list response here!", response)
        })

//        ActionDispatcher.instance.queue(req, LoginAction.self) { response in
//            print("response in trailing closure here!", response)
//        }
    }

}

