//
//  StationListView.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI

struct StationListView: View {
    @StateObject private var stationViewModel = StationViewModel()
    
    @State private var selectedStationLine: StationLine = .all
    @State var currentView: ViewState
    
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var previousView: ViewState
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack {
            CloseButton(isSheetPresented: $isSheetPresented)
                .padding(.top, 20)
                .padding(.trailing, 25)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text(currentView == .searchStartingStation ? "Starting Station" : "Destination Station")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            StationSearchBar(searchText: $stationViewModel.searchStation)
                .onChange(of: stationViewModel.searchStation) {
                    stationViewModel.filterSelectedStations(selectedLine: selectedStationLine,
                                                            currentView: currentView,
                                                            selectedStarting: selectedStarting,
                                                            selectedDestination: selectedDestination)
                }
            
            StationSearchBarFilter(selectedStationLine: $selectedStationLine)
                .onChange(of: selectedStationLine) {
                    stationViewModel.filterSelectedStations(selectedLine: selectedStationLine,
                                                            currentView: currentView,
                                                            selectedStarting: selectedStarting,
                                                            selectedDestination: selectedDestination)
                }
            
            Divider()
                .padding(.top, 8)
            
            StationSearchList(selectedStation: $stationViewModel.selectedStations,
                              currentView: $currentView,
                              previousView: $previousView,
                              selectedStarting: $selectedStarting,
                              selectedDestination: $selectedDestination,
                              isSheetPresented: $isSheetPresented)
        }
        .background(Color.white)
        .onAppear(perform: {
            stationViewModel.filterSelectedStations(selectedLine: .all,
                                                    currentView: currentView,
                                                    selectedStarting: selectedStarting,
                                                    selectedDestination: selectedDestination)
        })
    }
}
