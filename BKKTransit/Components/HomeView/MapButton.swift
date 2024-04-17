//
//  MapButton.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 15/3/2567 BE.
//

import SwiftUI

struct MapButton: View {
    @Binding var currentView: ViewState
    @Binding var previousView: ViewState
    @Binding var isMapView: Bool
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?

    @State private var isSavedRoutesPresented = false
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 40, height: 160)
                    .shadow(
                        color: .black.opacity(0.29),
                        radius: 4, x: 0, y: 4
                    )

                VStack {
                    Button(action: {
                        isSavedRoutesPresented = true
                    }) {
                        Image(systemName: "bookmark.fill")
                            .font(.title3)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 35, height: 35)
                    }
                    .sheet(isPresented: $isSavedRoutesPresented) {
                        SavedRoutesListView(currentView: $currentView,
                                            selectedStarting: $selectedStarting,
                                            selectedDestination: $selectedDestination,
                                            isSheetPresented: $isSavedRoutesPresented)
                    }
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 40, height: 1)
                    
                    Button(action: {
                        previousView = .home
                        isMapView.toggle()
                    }) {
                        Image(systemName: "map.fill")
                            .font(.title3)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 35, height: 35)
                    }
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 40, height: 1)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "info.circle.fill")
                            .font(.title3)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 35, height: 35)
                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal)
        .padding(.top, 30)
    }
}

#Preview {
    HomeView()
}
