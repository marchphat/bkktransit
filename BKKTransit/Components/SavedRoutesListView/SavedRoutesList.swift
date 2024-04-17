//
//  SavedRoutesList.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 4/4/2567 BE.
//

import SwiftUI

struct SavedRoutesList: View {
    @Binding var currentView: ViewState
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var isSheetPresented: Bool
    
    let savedRoute: [String] = ["A", "B"]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(savedRoute, id: \.self) { route in
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .contentShape(Rectangle())
                        .onTapGesture {
//                            selectedStarting = route
//                            selectedDestination = route.fee
                            isSheetPresented = false
                            
                            withAnimation(.spring()) {
                                DispatchQueue.main.async {
                                    currentView = .routeCreated
                                }
                            }
                        }
                
                    HStack {
                        ListViewHeaderWithPointer(selectedStarting: $selectedStarting,
                                                  selectedDestination: $selectedDestination)
                        
                        Image(systemName: "chevron.forward")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.gray)
                        
                        Spacer()
                    }
                    .padding(.trailing, 20)
                }
                .padding(.vertical, 8)
                
                Divider()
            }
        }
    }
}
