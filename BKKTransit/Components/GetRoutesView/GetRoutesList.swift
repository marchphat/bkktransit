//
//  GetRoutesList.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 15/3/2567 BE.
//

import SwiftUI

struct GetRoutesList: View {
    @Binding var routeStation: [Route]
    @Binding var shortestRoute: Route
    @Binding var cheapestRoute: Int
    
    @Binding var currentView: ViewState
    @Binding var selectedRoute: Route?
    @Binding var selectedRouteFees: Int
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(routeStation) { route in
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedRoute = route
                            selectedRouteFees = route.fee
                            isSheetPresented = false
                            
                            withAnimation(.spring()) {
                                DispatchQueue.main.async {
                                    currentView = .routeCreated
                                }
                            }
                        }
                
                    switch (route.stations.count == shortestRoute.stations.count,
                            route.fee == cheapestRoute) {
                    case (true, true):
                        GetRoutesDetailsCell(routeType: .shortNcheap,
                                             route: route,
                                             fees: route.fee)
                    case (true, false):
                        GetRoutesDetailsCell(routeType: .shortest,
                                             route: route,
                                             fees: route.fee)
                    case (false, true):
                        GetRoutesDetailsCell(routeType: .cheapest,
                                             route: route,
                                             fees: route.fee)
                    case (false, false):
                        GetRoutesDetailsCell(routeType: .general,
                                             route: route,
                                             fees: route.fee)
                    }
                }
                .padding(.vertical, 8)
                
                Divider()
            }
        }
    }
}
