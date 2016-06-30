//
// Created by Chris Jones on 6/30/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol JSONSerializable {
    init()

    init?(json: JSON?)

    func asJSON() -> JSON

    func asDictionary() -> [String:AnyObject]

    func stringify() -> String
}

public extension JSONSerializable {
    func asJSON() -> JSON {
        return JSON(asDictionary())
    }

    func stringify() -> String {
        let json = asJSON()
        let jsonString = json.rawString()!
        return jsonString
    }

//    public func toDictionaryArray<T:JSONSerializable>(array: [T]) -> [[String:AnyObject]] {
//        if array.capacity == 0 {
//            return []
//        }
//
//        var toArray: [[String:AnyObject]] = []
//        for item in array {
//            toArray.append(item.asDictionary())
//        }
//
//        return toArray
//    }
}