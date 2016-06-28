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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
    }

    func getDbPath() -> String {
        let documentsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        var path = documentsDir + "/db"

        if !NSFileManager.defaultManager().fileExistsAtPath(path) {
            do {
                try NSFileManager.defaultManager().createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Failed to create directory: " + path)
            }
        }
        path += "/snowreport5.sqlite"
        return path;
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)


        /*do {
            var config = Configuration()
            config.passphrase = "passme"

            let dbQueue = try DatabaseQueue(path: getDbPath(), configuration: config)
//            try dbQueue.changePassphrase("abc")

            try dbQueue.inDatabase {
                db in
                try db.execute(FacilityEntity.databaseTableCreateSql())

                let facility = FacilityEntity()
                facility.id = "b"
                facility.name = "ScrippsB"

                var addr = Address()
                addr.line1 = "Aln1"
                addr.line2 = "Bln2"
                addr.line3 = "Cln3"
                addr.city = "cty"
                addr.state = "st"
                addr.postalCode = "postcde"
                addr.country = "cntry"
                facility.applyAddress(addr)

                try facility.save(db)
            }

            try dbQueue.inDatabase {
                db in

                let facilities = FacilityEntity.fetchAll(db, "SELECT * FROM FacilityEntity")
                for f in facilities {
                    print("Facility", f.id, f.name, f.createAddress())
                }
            }
        } catch let unknownError {
            print("\(unknownError) unknown error catch here!")
        } catch {
            print("catch here!")
        }*/

        if (DatabaseManager.instance.connect()) {
            ActionDispatcher.instance.queue(SchemaAction.Request(), SchemaAction.self, nil)
            ActionDispatcher.instance.queue(WriteAction.Request(), WriteAction.self, nil)

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
                        print(s.name)
                    }
                }
            }

        }
    }

}

