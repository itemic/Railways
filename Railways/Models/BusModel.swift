// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var updateTime: String
    var updateInterval: Int
    var srcUpdateTime: String
    var srcUpdateInterval: Int
    var authorityCode: String
    var versionID: Int
    var routes: [Route]

    enum CodingKeys: String, CodingKey {
        case updateTime = "UpdateTime"
        case updateInterval = "UpdateInterval"
        case srcUpdateTime = "SrcUpdateTime"
        case srcUpdateInterval = "SrcUpdateInterval"
        case authorityCode = "AuthorityCode"
        case versionID = "VersionID"
        case routes = "Routes"
    }
}

// MARK: - Route
struct Route: Codable, Identifiable {
    var id, routeID: String
    var routeName: DepartureStopName
    var routeLongName: RouteLongName
    var hasSubRoutes: Bool
    var operators: [Operator]
    var routeType: Int
    var serviceType: [String: Bool]
    var ticketPriceDescription, departureStopName, destinationStopName, fareBufferZoneDescription: DepartureStopName
    var startStop, endStop: TerminusStop
    var isCircular: Bool
    var routeURL, liveBusURL: String
    var routeMapImageURL: String
    var fareURL: String
    var routeDistance: Double

    enum CodingKeys: String, CodingKey {
        case id = "RouteUID"
        case routeID = "RouteID"
        case routeName = "RouteName"
        case routeLongName = "RouteLongName"
        case hasSubRoutes = "HasSubRoutes"
        case operators = "Operators"
        case routeType = "RouteType"
        case serviceType = "ServiceType"
        case ticketPriceDescription = "TicketPriceDescription"
        case departureStopName = "DepartureStopName"
        case destinationStopName = "DestinationStopName"
        case fareBufferZoneDescription = "FareBufferZoneDescription"
        case startStop = "StartStop"
        case endStop = "EndStop"
        case isCircular = "IsCircular"
        case routeURL = "RouteURL"
        case liveBusURL = "LiveBusURL"
        case routeMapImageURL = "RouteMapImageURL"
        case fareURL = "FareURL"
        case routeDistance = "RouteDistance"
    }
}

// MARK: - DepartureStopName
struct DepartureStopName: Codable {
    var zhTw, en: String?

    enum CodingKeys: String, CodingKey {
        case zhTw = "Zh_tw"
        case en = "En"
    }
}

// MARK: - Stop
struct TerminusStop: Codable {
    var stopID: String
    var stopName: DepartureStopName

    enum CodingKeys: String, CodingKey {
        case stopID = "StopID"
        case stopName = "StopName"
    }
}

// MARK: - Operator
struct Operator: Codable {
    var operatorID: String
    var operatorName: DepartureStopName
    var operatorCode: String
    var operatorNo: String?

    enum CodingKeys: String, CodingKey {
        case operatorID = "OperatorID"
        case operatorName = "OperatorName"
        case operatorCode = "OperatorCode"
        case operatorNo = "OperatorNo"
    }
}

enum OperatorCode: String, Codable {
    case shingNanBus = "ShingNanBus"
    case siFangBus = "SiFangBus"
    case sinyingBus = "SinyingBus"
    case tainanCityBus = "TainanCityBus"
    case hanChengBus = "HanCheng Bus"
    case crownTransportation = "Crown Transportation"
}

// MARK: - RouteLongName
struct RouteLongName: Codable {
}
