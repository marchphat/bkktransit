//
//  RouteCreated.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 15/3/2567 BE.
//

import SwiftUI

struct RouteCreated: View {
    @State var selectedRoute: Route?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            if let selectedRoute = selectedRoute {
                ForEach(selectedRoute.stations) { station in
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .contentShape(Rectangle())
                        
                        RouteDetailsCell(station: station)
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}
