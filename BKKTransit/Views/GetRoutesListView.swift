//
//  GetRoutesListView.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI

struct GetRoutesListView: View {
    @ObservedObject private var routeViewModel = RouteViewModel()
    
    @Binding var currentView: ViewState
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var selectedRoute: Route?
    @Binding var selectedRouteFees: Int
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack {
            CloseButton(isSheetPresented: $isSheetPresented)
                .padding(.top, 20)
                .padding(.trailing, 25)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            Text("Routes")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ListViewHeaderWithPointer(selectedStarting: $selectedStarting, 
                                      selectedDestination: $selectedDestination)
            
            Divider()
                .padding(.top, 8)
            
            GetRoutesList(routeStation: $routeViewModel.allRoutes,
                          shortestRoute: $routeViewModel.shortestRoute,
                          cheapestRoute: $routeViewModel.cheapestRoute,
                          currentView: $currentView,
                          selectedRoute: $selectedRoute,
                          selectedRouteFees: $selectedRouteFees,
                          isSheetPresented: $isSheetPresented)
        }
        .background(Color.white)
        .onAppear(perform: {
            routeViewModel.fetchRoutes(fromStation: selectedStarting,
                                       toStation: selectedDestination)
        })
        
    }
}

struct ListViewHeaderWithPointer: View {
    @State private var pointerStraightHeight: CGFloat = 17
    
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?

    var body: some View {
        HStack {
            Pointer(straightlineHeight: pointerStraightHeight)
            
            VStack {
                RouteViewHeader(selectedStation: $selectedStarting,
                                stationType: "selectedStarting")
                
                RouteViewHeader(selectedStation: $selectedDestination,
                                stationType: "selectedDestination")
            }
            .padding(.leading, 5)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeView()
}

