import Foundation
import SwiftyJSON

struct WsListNotes {

    class Request: WsRequest {
        typealias Response = WsListNotes.Response
        
        var attrId: String?
        
        class func getPath() -> String {
            return "/attributable/notes/listnotes"
        }
        
        class func isQueueable() -> Bool {
            return false
        }
        
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
            
            if let attrId = json["attrId"].string {
                self.attrId = attrId
            }
        }
        
        func asDictionary() -> [String:AnyObject] {
            var dictionary:[String:AnyObject] = [:]
            
            if let attrId = self.attrId {
                dictionary["attrId"] = attrId
            }
            
            return dictionary
        }
    }

class NoteRecord: JSONSerializable {
    var id: String?
    var orgId: String?
    var ownerOrgUnitId: String?
    var attrType: AttributableType?
    var attrId: String?
    var orgVisible: Bool?
    var publicVisible: Bool?
    var noteValue: String?
    var createdById: String?
    var dateCreated: Int?
    var createdByDisplayName: String?
    var ownerOrgUnitName: String?
    var ownerOrgUnitLabel: String?
    var createdByInitials: String?

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
    
    if let orgId = json["orgId"].string {
        self.orgId = orgId
    }
    
    if let ownerOrgUnitId = json["ownerOrgUnitId"].string {
        self.ownerOrgUnitId = ownerOrgUnitId
    }
    
    if let attrTypeStringValue = json["attrType"].string {
        if let attrType = AttributableType(rawValue: attrTypeStringValue) {
            self.attrType = attrType
        }
    }
    
    if let attrId = json["attrId"].string {
        self.attrId = attrId
    }
    
    if let orgVisible = json["orgVisible"].bool {
        self.orgVisible = orgVisible
    }
    
    if let publicVisible = json["publicVisible"].bool {
        self.publicVisible = publicVisible
    }
    
    if let noteValue = json["noteValue"].string {
        self.noteValue = noteValue
    }
    
    if let createdById = json["createdById"].string {
        self.createdById = createdById
    }
    
    if let createdByDisplayName = json["createdByDisplayName"].string {
        self.createdByDisplayName = createdByDisplayName
    }
    
    if let ownerOrgUnitName = json["ownerOrgUnitName"].string {
        self.ownerOrgUnitName = ownerOrgUnitName
    }
    
    if let ownerOrgUnitLabel = json["ownerOrgUnitLabel"].string {
        self.ownerOrgUnitLabel = ownerOrgUnitLabel
    }
    
    if let createdByInitials = json["createdByInitials"].string {
        self.createdByInitials = createdByInitials
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let id = self.id {
        dictionary["id"] = id
    }
    
    if let orgId = self.orgId {
        dictionary["orgId"] = orgId
    }
    
    if let ownerOrgUnitId = self.ownerOrgUnitId {
        dictionary["ownerOrgUnitId"] = ownerOrgUnitId
    }
    
    if let attrType = self.attrType {
        dictionary["attrType"] = attrType.rawValue
    }
    
    if let attrId = self.attrId {
        dictionary["attrId"] = attrId
    }
    
    if let orgVisible = self.orgVisible {
        dictionary["orgVisible"] = orgVisible
    }
    
    if let publicVisible = self.publicVisible {
        dictionary["publicVisible"] = publicVisible
    }
    
    if let noteValue = self.noteValue {
        dictionary["noteValue"] = noteValue
    }
    
    if let createdById = self.createdById {
        dictionary["createdById"] = createdById
    }
    
    if let createdByDisplayName = self.createdByDisplayName {
        dictionary["createdByDisplayName"] = createdByDisplayName
    }
    
    if let ownerOrgUnitName = self.ownerOrgUnitName {
        dictionary["ownerOrgUnitName"] = ownerOrgUnitName
    }
    
    if let ownerOrgUnitLabel = self.ownerOrgUnitLabel {
        dictionary["ownerOrgUnitLabel"] = ownerOrgUnitLabel
    }
    
    if let createdByInitials = self.createdByInitials {
        dictionary["createdByInitials"] = createdByInitials
    }
    
    return dictionary
}
}

class Response: JSONSerializable {
    var code: WsListNotes.Code?
    var notes: [WsListNotes.NoteRecord]?

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
    
    if let codeStringValue = json["code"].string {
        if let code = WsListNotes.Code(rawValue: codeStringValue) {
            self.code = code
        }
    }
    
    if let notesArrayValue = json["notes"].array {
        self.notes = []
        for item in notesArrayValue {
            if let value = WsListNotes.NoteRecord(json: item), var notes = notes {
                notes.append(value)
            }
        }
    }
}

func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let code = self.code {
        dictionary["code"] = code.rawValue
    }
    
    return dictionary
}
}

enum Code: String {
    case SUCCESS
    case ATTR_ID_REQUIRED
    case FAILED
}

}
