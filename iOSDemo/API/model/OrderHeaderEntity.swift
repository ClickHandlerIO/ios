import Foundation
import GRDBCipher
import SwiftyJSON

class OrderHeaderEntity: AbstractEntity {
    var version: Int?
    var organizationId: String?
    var bizUnitId: String?
    var opsOrgUnitId: String?
    var salesOrgUnitId: String?
    var parentOrderId: String?
    var orderNumber: Int?
    var orderReference: String?
    var orderStatus: OrderStatus?
    var orderState: OrderState?
    var poNumber: String?
    var stateChanged: Int?
    var orderReasonId: String?
    var orderReasonName: String?
    var itemClass: ItemClass?
    var toLocationType: LocationType?
    var toLocationId: String?
    var toContainerType: StockContainerType?
    var toContainerId: String?
    var proxyLocationType: LocationType?
    var proxyLocationId: String?
    var sourceStartDate: Int?
    var deliverWindowStart: Int?
    var deliverWindowEnd: Int?
    var deliverToAddressLine1: String?
    var deliverToAddressLine2: String?
    var deliverToAddressLine3: String?
    var deliverToAddressCity: String?
    var deliverToAddressState: String?
    var deliverToAddressPostalCode: String?
    var deliverToAddressCountry: String?
    var expirationCutoff: Int?
    var loanId: String?
    var erpError: String?
    var subtotal: Double?
    var miscCharges: Double?
    var tax: Double?
    var grandTotal: Double?

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
    
    if let version = json["version"].int {
        self.version = version
    }
    
    if let organizationId = json["organizationId"].string {
        self.organizationId = organizationId
    }
    
    if let bizUnitId = json["bizUnitId"].string {
        self.bizUnitId = bizUnitId
    }
    
    if let opsOrgUnitId = json["opsOrgUnitId"].string {
        self.opsOrgUnitId = opsOrgUnitId
    }
    
    if let salesOrgUnitId = json["salesOrgUnitId"].string {
        self.salesOrgUnitId = salesOrgUnitId
    }
    
    if let parentOrderId = json["parentOrderId"].string {
        self.parentOrderId = parentOrderId
    }
    
    if let orderNumber = json["orderNumber"].int {
        self.orderNumber = orderNumber
    }
    
    if let orderReference = json["orderReference"].string {
        self.orderReference = orderReference
    }
    
    if let orderStatusStringValue = json["orderStatus"].string {
        if let orderStatus = OrderStatus(rawValue: orderStatusStringValue) {
            self.orderStatus = orderStatus
        }
    }
    
    if let orderStateStringValue = json["orderState"].string {
        if let orderState = OrderState(rawValue: orderStateStringValue) {
            self.orderState = orderState
        }
    }
    
    if let poNumber = json["poNumber"].string {
        self.poNumber = poNumber
    }
    
    if let orderReasonId = json["orderReasonId"].string {
        self.orderReasonId = orderReasonId
    }
    
    if let orderReasonName = json["orderReasonName"].string {
        self.orderReasonName = orderReasonName
    }
    
    if let itemClassStringValue = json["itemClass"].string {
        if let itemClass = ItemClass(rawValue: itemClassStringValue) {
            self.itemClass = itemClass
        }
    }
    
    if let toLocationTypeStringValue = json["toLocationType"].string {
        if let toLocationType = LocationType(rawValue: toLocationTypeStringValue) {
            self.toLocationType = toLocationType
        }
    }
    
    if let toLocationId = json["toLocationId"].string {
        self.toLocationId = toLocationId
    }
    
    if let toContainerTypeStringValue = json["toContainerType"].string {
        if let toContainerType = StockContainerType(rawValue: toContainerTypeStringValue) {
            self.toContainerType = toContainerType
        }
    }
    
    if let toContainerId = json["toContainerId"].string {
        self.toContainerId = toContainerId
    }
    
    if let proxyLocationTypeStringValue = json["proxyLocationType"].string {
        if let proxyLocationType = LocationType(rawValue: proxyLocationTypeStringValue) {
            self.proxyLocationType = proxyLocationType
        }
    }
    
    if let proxyLocationId = json["proxyLocationId"].string {
        self.proxyLocationId = proxyLocationId
    }
    
    if let deliverToAddress = Address(json: json["deliverToAddress"]) {
        self.deliverToAddressLine1 = deliverToAddress.line1
        self.deliverToAddressLine2 = deliverToAddress.line2
        self.deliverToAddressLine3 = deliverToAddress.line3
        self.deliverToAddressCity = deliverToAddress.city
        self.deliverToAddressState = deliverToAddress.state
        self.deliverToAddressPostalCode = deliverToAddress.postalCode
        self.deliverToAddressCountry = deliverToAddress.country
    }
    
    if let loanId = json["loanId"].string {
        self.loanId = loanId
    }
    
    if let erpError = json["erpError"].string {
        self.erpError = erpError
    }
    
    if let subtotal = json["subtotal"].double {
        self.subtotal = subtotal
    }
    
    if let miscCharges = json["miscCharges"].double {
        self.miscCharges = miscCharges
    }
    
    if let tax = json["tax"].double {
        self.tax = tax
    }
    
    if let grandTotal = json["grandTotal"].double {
        self.grandTotal = grandTotal
    }
}

override func asDictionary() -> [String:AnyObject] {
    var dictionary:[String:AnyObject] = [:]
    
    if let version = self.version {
        dictionary["version"] = version
    }
    
    if let organizationId = self.organizationId {
        dictionary["organizationId"] = organizationId
    }
    
    if let bizUnitId = self.bizUnitId {
        dictionary["bizUnitId"] = bizUnitId
    }
    
    if let opsOrgUnitId = self.opsOrgUnitId {
        dictionary["opsOrgUnitId"] = opsOrgUnitId
    }
    
    if let salesOrgUnitId = self.salesOrgUnitId {
        dictionary["salesOrgUnitId"] = salesOrgUnitId
    }
    
    if let parentOrderId = self.parentOrderId {
        dictionary["parentOrderId"] = parentOrderId
    }
    
    if let orderNumber = self.orderNumber {
        dictionary["orderNumber"] = orderNumber
    }
    
    if let orderReference = self.orderReference {
        dictionary["orderReference"] = orderReference
    }
    
    if let orderStatus = self.orderStatus {
        dictionary["orderStatus"] = orderStatus.rawValue
    }
    
    if let orderState = self.orderState {
        dictionary["orderState"] = orderState.rawValue
    }
    
    if let poNumber = self.poNumber {
        dictionary["poNumber"] = poNumber
    }
    
    if let orderReasonId = self.orderReasonId {
        dictionary["orderReasonId"] = orderReasonId
    }
    
    if let orderReasonName = self.orderReasonName {
        dictionary["orderReasonName"] = orderReasonName
    }
    
    if let itemClass = self.itemClass {
        dictionary["itemClass"] = itemClass.rawValue
    }
    
    if let toLocationType = self.toLocationType {
        dictionary["toLocationType"] = toLocationType.rawValue
    }
    
    if let toLocationId = self.toLocationId {
        dictionary["toLocationId"] = toLocationId
    }
    
    if let toContainerType = self.toContainerType {
        dictionary["toContainerType"] = toContainerType.rawValue
    }
    
    if let toContainerId = self.toContainerId {
        dictionary["toContainerId"] = toContainerId
    }
    
    if let proxyLocationType = self.proxyLocationType {
        dictionary["proxyLocationType"] = proxyLocationType.rawValue
    }
    
    if let proxyLocationId = self.proxyLocationId {
        dictionary["proxyLocationId"] = proxyLocationId
    }
    
    dictionary["deliverToAddress"] = createDeliverToAddress().asDictionary()
    
    if let loanId = self.loanId {
        dictionary["loanId"] = loanId
    }
    
    if let erpError = self.erpError {
        dictionary["erpError"] = erpError
    }
    
    if let subtotal = self.subtotal {
        dictionary["subtotal"] = subtotal
    }
    
    if let miscCharges = self.miscCharges {
        dictionary["miscCharges"] = miscCharges
    }
    
    if let tax = self.tax {
        dictionary["tax"] = tax
    }
    
    if let grandTotal = self.grandTotal {
        dictionary["grandTotal"] = grandTotal
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

// DeliverToAddress

func createDeliverToAddress() -> Address {
    let deliverToAddress = Address()
    deliverToAddress.line1 = self.deliverToAddressLine1
    deliverToAddress.line2 = self.deliverToAddressLine2
    deliverToAddress.line3 = self.deliverToAddressLine3
    deliverToAddress.city = self.deliverToAddressCity
    deliverToAddress.state = self.deliverToAddressState
    deliverToAddress.postalCode = self.deliverToAddressPostalCode
    deliverToAddress.country = self.deliverToAddressCountry
    return deliverToAddress
}

func applyDeliverToAddress(deliverToAddress: Address) {
    self.deliverToAddressLine1 = deliverToAddress.line1
    self.deliverToAddressLine2 = deliverToAddress.line2
    self.deliverToAddressLine3 = deliverToAddress.line3
    self.deliverToAddressCity = deliverToAddress.city
    self.deliverToAddressState = deliverToAddress.state
    self.deliverToAddressPostalCode = deliverToAddress.postalCode
    self.deliverToAddressCountry = deliverToAddress.country
}
}
