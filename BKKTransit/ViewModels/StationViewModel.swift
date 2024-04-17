//
//  StationViewModel.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import Foundation

final class StationViewModel: ObservableObject {
    @Published var searchStation = ""
    @Published var selectedStations = [Station]()
    @Published var allStations = [Station]()
    @Published var arrivalTime: [String] = []
    
    private enum APIError: Error {
        case invalidParameters
        case invalidResponse
    }
    
    init() {
        fetchStations()
    }
    
    private func fetchStations() {
        guard let url = Bundle.main.url(forResource: "Stations", withExtension: "json") else {
            print("Stations.json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let stations = try JSONDecoder().decode([Station].self, from: data)
            self.allStations = stations
        } catch {
            print("Error fetching JSON: \(error.localizedDescription)")
        }
    }

    private func isMatched(station: Station, selectedLine: StationLine, currentView: ViewState, selectedStarting: Station?, selectedDestination: Station?) -> Bool {
        let lineMatch = selectedLine == .all || station.line?.lowercased() == selectedLine.rawValue
        var searchTextMatch = true
        
        if !searchStation.isEmpty {
            let stationToSearch = searchStation.replacingOccurrences(of: " ", with: "").lowercased()
            let stationName = (station.name?.replacingOccurrences(of: " ", with: "") ?? "").lowercased()
            let nameMatch = stationName.contains(stationToSearch)
            let idMatch = station.stationId?.localizedCaseInsensitiveContains(searchStation) == true
            searchTextMatch = nameMatch || idMatch
        }
        
        switch currentView {
        case .searchStartingStation:
            return lineMatch && searchTextMatch
        case .searchDestination:
            return lineMatch && searchTextMatch
        default:
            return false
        }
    }
    
    func filterSelectedStations(selectedLine: StationLine, currentView: ViewState, selectedStarting: Station?, selectedDestination: Station?) {
        selectedStations = allStations.filter { station in
            return isMatched(station: station,
                             selectedLine: selectedLine,
                             currentView: currentView,
                             selectedStarting: selectedStarting,
                             selectedDestination: selectedDestination)
        }
    }
    
    func getArrivalTime(stationId: String?) {
        guard let stationId = stationId else { return }
        
        let getArrivalTime = getArrivingTime(station_id: stationId)
        var formatedTime = [String]()
        
        for time in getArrivalTime {
            if time != "out of service" {
                let timeHHMM = String(time.prefix(5))
                formatedTime.append(timeHHMM)
            } else {
                formatedTime.append(time)
            }
        }
        arrivalTime = formatedTime
    }
}
