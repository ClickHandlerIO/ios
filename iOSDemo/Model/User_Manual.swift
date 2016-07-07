//
// Created by Chris Jones on 7/1/16.
// Copyright (c) 2016 ClickHandlerIO. All rights reserved.
//

import Foundation
import SwiftyJSON

class User_Manual: JSONSerializable {
    var entity: UserEntity?

    required init() {
    }

    // JSON

     convenience required init?(json: JSON?) {
        guard let json = json else {
            return nil
        }
        self.init()
        self.merge(json)
    }

     func merge(json: JSON?) {
        guard let json = json else {
            return
        }

        self.entity = UserEntity(json: json["entity"])
    }

    func asDictionary() -> [String:AnyObject] {
        var dictionary = [String: AnyObject]()

        if let entity = self.entity {
            dictionary["entity"] = entity.asDictionary()
        }

        return dictionary
    }
}
