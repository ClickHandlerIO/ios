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

//        let mirror = Mirror(reflecting: FacilityEntity())
//        for child in mirror.children {
//            guard let label = child.label else {
//                continue
//            }
//
//            print(child.value.dynamicType)
//            print(label + " type: " + String(child.value.dynamicType), child.value)
//        }


        var listReq = ListAction.Request()
        listReq.search = "search me"

            ActionDispatcher.instance.queue(listReq, ListAction.self) {
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
                        print(s)
                    }
                }
            }
        

    }

}

