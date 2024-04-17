//
//  Route.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import Foundation

struct Route: Codable, Equatable, Identifiable {
    var id = UUID()
    var stations: [Station]
    var fee: Int
    var time: String
    
    init(stations: [Station], fee: Int, time: String) {
        self.stations = stations
        self.fee = fee
        self.time = time
    }
}

enum RouteType {
    case shortNcheap
    case shortest
    case cheapest
    case general
}

