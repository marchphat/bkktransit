//
//  RouteViewModel.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import Foundation

final class RouteViewModel: ObservableObject {
    @Published var allRoutes = [Route]()
    @Published var shortestRoute: Route = Route(stations: [], fee: 0, time: "")
    @Published var cheapestRoute: Int = 0
    
    private var allRouteFees = [Int]()

    func fetchRoutes(fromStation: Station?, toStation: Station?) {
        guard let fromStation = fromStation?.stationId, let toStation = toStation?.stationId else {
            print("Station is nil value.")
            return
        }
        
        allRoutes = getAllPossibleRoutes(start: fromStation, end: toStation)
        allRoutes.sort { $0.stations.count < $1.stations.count }
        findShortestRoute()
        findCheapestRoute()
    }
   
    private func findShortestRoute() {
        guard let shortest = allRoutes.min(by: { $0.stations.count < $1.stations.count }) else {
            return
        }
        shortestRoute = shortest
    }
    
    private func findCheapestRoute() {
        allRouteFees = allRoutes.map { $0.fee }
        cheapestRoute = allRouteFees.min { $0 < $1 } ?? 0
    }
}
