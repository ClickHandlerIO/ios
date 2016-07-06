import Foundation
import GRDBCipher
import SwiftyJSON

class EventEntity: AbstractEntity {
    var eventType: EventType?
    var eventDate: Int?
    var eventDuration: Int?
    var eventStatus: EventStatus?
    var eventState: EventState?
    var stateChanged: Int?
    var eventDescription: String?

// JSON

required init() {
    super.init()
}

convenience required init?(json: JSON?) {
    guard let json = json else {
        return nil
    }
    self.init()
    self.merge(json)
}

override func merge(json: JSON?) {
    guard let json = json else {
        return
    }
    
    if let eventTypeStringValue = json["eventType"].string {
        if let eventType = EventType(rawValue: eventTypeStringValue) {
            self.eventType = eventType
        }
    }
    
    if let eventDuration = json["eventDuration"].int {
        self.eventDuration = eventDuration
    }
    
    if let eventStatusStringValue = json["eventStatus"].string {
        if let eventStatus = EventStatus(rawValue: eventStatusStringValue) {
            self.eventStatus = eventStatus
        }
    }
    
    if let eventStateStringValue = json["eventState"].string {
        if let eventState = EventState(rawValue: eventStateStringValue) {
            self.eventState = eventState
        }
    }
    
    if let eventDescription = json["eventDescription"].string {
        self.eventDescription = eventDescription
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let eventType = self.eventType {
        dictionary["eventType"] = eventType.rawValue
    }
    
    if let eventDuration = self.eventDuration {
        dictionary["eventDuration"] = eventDuration
    }
    
    if let eventStatus = self.eventStatus {
        dictionary["eventStatus"] = eventStatus.rawValue
    }
    
    if let eventState = self.eventState {
        dictionary["eventState"] = eventState.rawValue
    }
    
    if let eventDescription = self.eventDescription {
        dictionary["eventDescription"] = eventDescription
    }
    
    return dictionary
}

// SQL

override class func databaseTableCreateSql() -> String {
    return ""
}

required init(_ row: Row) {
    super.init(row)
}

override var persistentDictionary: [String:DatabaseValueConvertible?] {
    return [:]
}
}
