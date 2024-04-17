//
//  Parking.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 1/4/2567 BE.
//

import Foundation

struct Parking: Codable {
    let parkingId: String
    let parkingLotName: String
    let stationId: String
    let carLot: Int
    let carFee: Int
    let carFeePer: Int
    let carFeeUse: Int
    let carFeeUsePer: Int
    let carFeeDay: Int
    let carFeeMonth: Int
    let carInside: Bool
    let motorcyleLot: Int
    let motorcyleFee: Int
    let motorcyleFeePer: Int
    let motorcyleFeeUse: Int
    let motorcyleFeeUsePer: Int
    let motorcyleFeeDay: Int
    let motorcyleFeeMonth: Int
    let motorcyleInside: Bool
    let openTime: String
    let closeTime: String
    let openTimeWeekend: String
    let closeTimeWeekend: String
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case parkingId = "parking_id"
        case parkingLotName = "parkinglot_name"
        case stationId = "station_id"
        case carLot = "car_lot"
        case carFee = "car_fee"
        case carFeePer = "car_fee_per"
        case carFeeUse = "car_fee_use"
        case carFeeUsePer = "car_fee_use_per"
        case carFeeDay = "car_fee_day"
        case carFeeMonth = "car_fee_month"
        case carInside = "car_inside"
        case motorcyleLot = "motorcycle_lot"
        case motorcyleFee = "motorcycle_fee"
        case motorcyleFeePer = "motorcycle_fee_per"
        case motorcyleFeeUse = "motorcycle_fee_use"
        case motorcyleFeeUsePer = "motorcycle_fee_use_per"
        case motorcyleFeeDay = "motorcycle_fee_day"
        case motorcyleFeeMonth = "motorcycle_fee_month"
        case motorcyleInside = "motorcycle_inside"
        case openTime = "open_time"
        case closeTime = "close_time"
        case openTimeWeekend = "open_time_weekend"
        case closeTimeWeekend = "close_time_weekend"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}
