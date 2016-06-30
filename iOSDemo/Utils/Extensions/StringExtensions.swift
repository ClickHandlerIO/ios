//
//  StringExtesions.swift
//  Move
//
//  Created by Derrick Willer on 5/5/16.
//  Copyright © 2016 Axis Medical Technologies. All rights reserved.
//

import Foundation
import SwiftyJSON

extension String {
    var length: Int {
        return self.characters.count
    }

    func toJSON() -> JSON? {
        guard let data = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) else {
            return nil
        }
        return JSON(data: data)
    }

    func left(position: Int) -> String {
        let index = self.startIndex.advancedBy(position)
        return self.substringToIndex(index)
    }

    func right(position: Int) -> String {
        let index = self.endIndex.advancedBy(-position)
        return self.substringFromIndex(index)
    }

    func contains(find: String) -> Bool {
        return self.rangeOfString(find) != nil
    }

    static func localizedString(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }

    func isNullOrEmpty() -> Bool {
        if (self ?? "").isEmpty {
            return true
        } else {
            return false
        }
    }
}