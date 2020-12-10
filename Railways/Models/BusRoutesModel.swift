// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let routeStops = try? newJSONDecoder().decode(RouteStops.self, from: jsonData)

import Foundation

// MARK: - RouteStops
struct RouteStops: Codable {
    var versionID: Int
    var updateTime: String
    var updateInterval: Int
    var srcUpdateTime: String
    var srcUpdateInterval: Int
    var authorityCode: String
    var stopOfRoutes: [StopOfRoute]

    enum CodingKeys: String, CodingKey {
        case versionID = "VersionID"
        case updateTime = "UpdateTime"
        case updateInterval = "UpdateInterval"
        case srcUpdateTime = "SrcUpdateTime"
        case srcUpdateInterval = "SrcUpdateInterval"
        case authorityCode = "AuthorityCode"
        case stopOfRoutes = "StopOfRoutes"
    }
}

// MARK: - StopOfRoute
struct StopOfRoute: Codable {
    var routeUID, routeID: String
    var routeName: Name
    var operators: [Operator]
    var subRouteUID, subRouteID: String
    var subRouteName: Name
    var direction: Int
    var stops: [Stop]

    enum CodingKeys: String, CodingKey {
        case routeUID = "RouteUID"
        case routeID = "RouteID"
        case routeName = "RouteName"
        case operators = "Operators"
        case subRouteUID = "SubRouteUID"
        case subRouteID = "SubRouteID"
        case subRouteName = "SubRouteName"
        case direction = "Direction"
        case stops = "Stops"
    }
}

// MARK: - Name
struct Name: Codable {
    var zhTw, en: String

    enum CodingKeys: String, CodingKey {
        case zhTw = "Zh_tw"
        case en = "En"
    }
}

// MARK: - Stop
struct Stop: Codable {
    var stopUID, stopID: String
    var stopName: Name
    var boardingType, stopSequence: Int
    var stopPosition: StopPosition
    var isSectionPoint: Bool

    enum CodingKeys: String, CodingKey {
        case stopUID = "StopUID"
        case stopID = "StopID"
        case stopName = "StopName"
        case boardingType = "BoardingType"
        case stopSequence = "StopSequence"
        case stopPosition = "StopPosition"
        case isSectionPoint = "IsSectionPoint"
    }
}

// MARK: - StopPosition
struct StopPosition: Codable {
    var positionLat, positionLon: Double

    enum CodingKeys: String, CodingKey {
        case positionLat = "PositionLat"
        case positionLon = "PositionLon"
    }
}
