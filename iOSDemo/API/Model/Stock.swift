import Foundation
import SwiftyJSON

class Stock: JSONSerializable {
    var id: String?
    var itemId: String?
    var itemNumber: String?
    var itemShortDesc: String?
    var itemLongDesc: String?
    var itemType: ItemType?
    var itemClass: ItemClass?
    var itemVersionId: String?
    var itemVersion: String?
    var lotId: String?
    var lotNumber: String?
    var serialId: String?
    var serialNumber: String?
    var container: Container?
    var rootContainer: Container?
    var homeLocation: Location?
    var fromLocation: Location?
    var location: Location?
    var toLocation: Location?
    var dueBackToLocation: Location?
    var lostReason: LostReason?
    var lostReasonId: String?
    var foundReason: FoundReason?
    var foundReasonId: String?

// JSON

required init() {
}

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
    
    if let id = json["id"].string {
        self.id = id
    }
    
    if let itemId = json["itemId"].string {
        self.itemId = itemId
    }
    
    if let itemNumber = json["itemNumber"].string {
        self.itemNumber = itemNumber
    }
    
    if let itemShortDesc = json["itemShortDesc"].string {
        self.itemShortDesc = itemShortDesc
    }
    
    if let itemLongDesc = json["itemLongDesc"].string {
        self.itemLongDesc = itemLongDesc
    }
    
    if let itemTypeStringValue = json["itemType"].string {
        if let itemType = ItemType(rawValue: itemTypeStringValue) {
            self.itemType = itemType
        }
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let itemVersionId = json["itemVersionId"].string {
        self.itemVersionId = itemVersionId
    }
    
    if let itemVersion = json["itemVersion"].string {
        self.itemVersion = itemVersion
    }
    
    if let lotId = json["lotId"].string {
        self.lotId = lotId
    }
    
    if let lotNumber = json["lotNumber"].string {
        self.lotNumber = lotNumber
    }
    
    if let serialId = json["serialId"].string {
        self.serialId = serialId
    }
    
    if let serialNumber = json["serialNumber"].string {
        self.serialNumber = serialNumber
    }
    
    self.container = Container(json: json["container"])
    
    self.rootContainer = Container(json: json["rootContainer"])
    
    self.homeLocation = Location(json: json["homeLocation"])
    
    self.fromLocation = Location(json: json["fromLocation"])
    
    self.location = Location(json: json["location"])
    
    self.toLocation = Location(json: json["toLocation"])
    
    self.dueBackToLocation = Location(json: json["dueBackToLocation"])
    
    if let lostReasonStringValue = json["lostReason"].string {
        if let lostReason = LostReason(rawValue: lostReasonStringValue) {
            self.lostReason = lostReason
        }
    }
    
    if let lostReasonId = json["lostReasonId"].string {
        self.lostReasonId = lostReasonId
    }
    
    if let foundReasonStringValue = json["foundReason"].string {
        if let foundReason = FoundReason(rawValue: foundReasonStringValue) {
            self.foundReason = foundReason
        }
    }
    
    if let foundReasonId = json["foundReasonId"].string {
        self.foundReasonId = foundReasonId
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let itemId = self.itemId {
        dictionary["itemId"] = itemId
    }
    
    if let itemNumber = self.itemNumber {
        dictionary["itemNumber"] = itemNumber
    }
    
    if let itemShortDesc = self.itemShortDesc {
        dictionary["itemShortDesc"] = itemShortDesc
    }
    
    if let itemLongDesc = self.itemLongDesc {
        dictionary["itemLongDesc"] = itemLongDesc
    }
    
    if let itemType = self.itemType {
        dictionary["itemType"] = itemType.rawValue
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let itemVersionId = self.itemVersionId {
        dictionary["itemVersionId"] = itemVersionId
    }
    
    if let itemVersion = self.itemVersion {
        dictionary["itemVersion"] = itemVersion
    }
    
    if let lotId = self.lotId {
        dictionary["lotId"] = lotId
    }
    
    if let lotNumber = self.lotNumber {
        dictionary["lotNumber"] = lotNumber
    }
    
    if let serialId = self.serialId {
        dictionary["serialId"] = serialId
    }
    
    if let serialNumber = self.serialNumber {
        dictionary["serialNumber"] = serialNumber
    }
    
    if let container = self.container {
        dictionary["container"] = container.asDictionary()
    }
    
    if let rootContainer = self.rootContainer {
        dictionary["rootContainer"] = rootContainer.asDictionary()
    }
    
    if let homeLocation = self.homeLocation {
        dictionary["homeLocation"] = homeLocation.asDictionary()
    }
    
    if let fromLocation = self.fromLocation {
        dictionary["fromLocation"] = fromLocation.asDictionary()
    }
    
    if let location = self.location {
        dictionary["location"] = location.asDictionary()
    }
    
    if let toLocation = self.toLocation {
        dictionary["toLocation"] = toLocation.asDictionary()
    }
    
    if let dueBackToLocation = self.dueBackToLocation {
        dictionary["dueBackToLocation"] = dueBackToLocation.asDictionary()
    }
    
    if let lostReason = self.lostReason {
        dictionary["lostReason"] = lostReason.rawValue
    }
    
    if let lostReasonId = self.lostReasonId {
        dictionary["lostReasonId"] = lostReasonId
    }
    
    if let foundReason = self.foundReason {
        dictionary["foundReason"] = foundReason.rawValue
    }
    
    if let foundReasonId = self.foundReasonId {
        dictionary["foundReasonId"] = foundReasonId
    }
    
    return dictionary
}
}
