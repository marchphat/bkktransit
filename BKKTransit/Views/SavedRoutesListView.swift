//
//  SavedRoutesListView.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 4/4/2567 BE.
//

import SwiftUI

struct SavedRoutesListView: View {
    @ObservedObject private var routeViewModel = RouteViewModel()
    
    @Binding var currentView: ViewState
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack {
            CloseButton(isSheetPresented: $isSheetPresented)
                .padding(.top, 20)
                .padding(.trailing, 25)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            Text("Saved Routes")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(.top, 8)
            
            SavedRoutesList(currentView: $currentView,
                            selectedStarting: $selectedStarting,
                            selectedDestination: $selectedDestination,
                            isSheetPresented: $isSheetPresented)
        }
        .background(Color.white)
    }
}

#Preview {
    HomeView()
}

