//
//  ViewController.swift
//  iOSDemo
//
//  Created by Chris Jones on 6/24/16.
//  Copyright © 2016 ClickHandlerIO. All rights reserved.
//

import UIKit
import GRDBCipher

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        let btn: UIButton = UIButton(frame: CGRectMake(100, 400, 100, 50))
        btn.setTitle("Fire Event", forState: .Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(fireEvent), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

//        subscribe(LoggedInEvent.self) {
//            (event: LoggedInEvent) in
//            print("Received Event!", event.username)
//        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if (DatabaseManager.instance.open()) {
            dispatch(SchemaAction.Request(), SchemaAction.self, nil)
            dispatch(WriteAction.Request(), WriteAction.self, nil)
            loadData()
        }
    }

    func fireEvent() {
//        EventBus.publish(LoggedInEvent("Jane Doe"))
        loadData()

        WsDispatcher.instance.send(LoginRequest()) {
            (response: LoginResponse) in
            print("HERE!", response.code)
        }
    }

    func loadData() {
        dispatch(ListAction.Request("search text"), ListAction.self) {
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

