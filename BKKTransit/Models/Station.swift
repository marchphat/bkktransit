//
//  Station.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import Foundation
import CoreLocation

struct Station: Codable, Equatable, Identifiable {
    let id = UUID()
    let stationId: String?
    let name: String?
    let line: String?
    let lineColor: String?
    let isExtended: Bool
    let startTime1: String
    let startTime2: String
    let startTime3: String?
    let startTime4: String?
    let lastTime1: String
    let lastTime2: String
    let lastTime3: String?
    let lastTime4: String?
    let positionX: Double
    let positionY: Double
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case stationId = "station_id"
        case name = "station_name"
        case line = "station_line"
        case lineColor = "station_linecolor"
        case isExtended = "is_extended"
        case startTime1 = "start_time_1"
        case startTime2 = "start_time_2"
        case startTime3 = "start_time_3"
        case startTime4 = "start_time_4"
        case lastTime1 = "last_time_1"
        case lastTime2 = "last_time_2"
        case lastTime3 = "last_time_3"
        case lastTime4 = "last_time_4"
        case positionX = "positionX"
        case positionY = "positionY"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

enum StationLine: String {
    case all = "all"
    case bts = "bts"
    case mrt = "mrt"
    case arl = "arl"
    case srt = "srt"
}
