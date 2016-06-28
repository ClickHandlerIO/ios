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
        path += "/snowreport.sqlite"
        return path;
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)


        do {
            let dbQueue = try DatabaseQueue(path: getDbPath())
//            try dbQueue.changePassphrase("passme1234")

//            try dbQueue.inDatabase {
//                db in
//                try db.execute(
//                "CREATE TABLE pointOfInterests (" +
//                        "id INTEGER PRIMARY KEY, " +
//                        "title TEXT, " +
//                        "favorite BOOLEAN NOT NULL, " +
//                        "latitude DOUBLE NOT NULL, " +
//                        "longitude DOUBLE NOT NULL" +
//                        ")")
//
//                try db.execute(
//                "INSERT INTO pointOfInterests (title, favorite, latitude, longitude) " +
//                        "VALUES (?, ?, ?, ?)",
//                        arguments: ["Paris", true, 48.85341, 2.3488])
//
//                let parisId = db.lastInsertedRowID
//            }

            try dbQueue.inDatabase {
                db in
                for row in Row.fetch(db, "SELECT * FROM pointOfInterests") {
                    let title: String = row.value(named: "title")
                    let favorite: Bool = row.value(named: "favorite")
//                    let coordinate = CLLocationCoordinate2DMake(
//                    row.value(named: "latitude"),
//                            row.value(named: "longitude"))
//                }

                    let poiCount = Int.fetchOne(db, "SELECT COUNT(*) FROM pointOfInterests")! // Int
                    let poiTitles = String.fetchAll(db, "SELECT title FROM pointOfInterests") // [String]
                    print("stuff", poiCount, poiTitles)
                }
            }

            // Extraction
            let poiCount = try dbQueue.inDatabase { db in
                var extraction = Int.fetchOne(db, "SELECT COUNT(*) FROM pointOfInterests")!
                print("extraction", extraction)
            }
        } catch let unknownError {
            print("\(unknownError) unknown error catch here!")
        } catch {
            print("catch here!")
        }

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

