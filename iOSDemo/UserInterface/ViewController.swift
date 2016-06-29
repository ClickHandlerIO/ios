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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        EventBus.subscribe(LoggedInEvent.self) { e in
            let event = e as! LoggedInEvent
            print("Received Event!", event.username)
        }

        let btn:UIButton = UIButton(frame: CGRectMake(100, 400, 100, 50))
//        btn.frame = CGRectMake(300,300,300,500)
        btn.setTitle("Fire Event", forState: .Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        btn.addTarget(self, action:#selector(fireEvent), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
    }

    func fireEvent() {
        EventBus.publish(LoggedInEvent("Jane Doe"))
    }

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

