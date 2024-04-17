//
//  HomeView.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject private var stationViewModel = StationViewModel()
        
    @State private var currentView = ViewState.home
    @State private var selectedStarting: Station?
    @State private var selectedDestination: Station?
    @State private var previousView: ViewState = ViewState.home
    @State private var selectedRoute: Route?
    @State private var selectedRouteFees: Int = 0
    @State private var isMapView: Bool = false
    
    var body: some View {
        ZStack {
            if isMapView {
                MapView(previousView: $previousView,
                        selectedStarting: $selectedStarting,
                        selectedDestination: $selectedDestination)
            } else {
                GraphicMapView(previousView: $previousView,
                               selectedStarting: $selectedStarting,
                               selectedDestination: $selectedDestination)
            }
            
            if currentView == .home {
                MapButton(currentView: $currentView,
                          previousView: $previousView,
                          isMapView: $isMapView,
                          selectedStarting: $selectedStarting,
                          selectedDestination: $selectedDestination)
                
                StationSearchBox(
                    previousView: $previousView,
                    currentView: $currentView,
                    selectedStarting: $selectedStarting,
                    selectedDestination: $selectedDestination,
                    selectedRoute: $selectedRoute,
                    selectedRouteFees: $selectedRouteFees)
            } 
            else if currentView == .routeCreated {
                RouteCreatedView(selectedStarting: $selectedStarting,
                                 selectedDestination: $selectedDestination,
                                 selectedRoute: $selectedRoute,
                                 selectedRouteFees: $selectedRouteFees,
                                 currentView: $currentView)
            }
        }
    }
}

#Preview {
    HomeView()
}

