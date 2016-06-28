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

        var listReq = ListAction.Request()
        listReq.search = "searching..."
        ActionDispatcher.instance.queue(listReq, ListAction.self, {
            (response: ListAction.Response) in
            print("list response here!", response)
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
                    print(s)
                }
            }

        })
    }

}

