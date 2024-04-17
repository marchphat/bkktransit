//
//  Density.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 31/3/2567 BE.
//

import Foundation

enum DensityStatus: String {
    case low = "low"
    case medium = "medium"
    case high = "high"
}

struct UserStatus: Codable {
    let userId: String
    let stationId: String
    let userStatus: Bool
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case stationId = "station_id"
        case userStatus = "status"
    }
}

struct StationDensity: Decodable {
    let stationId: String
    let stationDensity: String
    
    enum CodingKeys: String, CodingKey {
        case stationId = "station_id"
        case stationDensity = "result"
    }
}

struct ParkingDensity: Encodable {
    let userId: String
    let parkingId: String
    let userVehical: String
    let userStatus: Bool
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case parkingId = "station_id"
        case userVehical = "vehical"
        case userStatus = "status"
    }
}
