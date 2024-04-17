//
//  StationSearchBox.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI

struct StationSearchBox: View {
    @Binding var previousView: ViewState
    @Binding var currentView: ViewState
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var selectedRoute: Route?
    @Binding var selectedRouteFees: Int
    
    private var isInputCompleted: Bool  {
        return selectedStarting == nil || selectedDestination == nil
    }
    
    @State private var fromText = "From"
    @State private var toText = "To"
    @State private var isStartingListPresented = false
    @State private var isDestinationListPresented = false
    @State private var isGetRoutesPresented = false
    
    var body: some View {
        VStack {
            HStack{                
                VStack (spacing: 10) {
                    StationSearchField(selectedStation: $selectedStarting, inputType: $fromText)
                        .onTapGesture {
                            isStartingListPresented = true
                        }
                        .sheet(isPresented: $isStartingListPresented) {
                            StationListView(
                                currentView: .searchStartingStation,
                                selectedStarting: $selectedStarting,
                                selectedDestination: $selectedDestination,
                                previousView: $previousView, 
                                isSheetPresented: $isStartingListPresented
                            )
                        }
                    
                    StationSearchField(selectedStation: $selectedDestination, inputType: $toText)
                        .onTapGesture {
                            isDestinationListPresented = true
                        }
                        .sheet(isPresented: $isDestinationListPresented) {
                            StationListView(
                                currentView: .searchDestination,
                                selectedStarting: $selectedStarting,
                                selectedDestination: $selectedDestination,
                                previousView: $previousView,
                                isSheetPresented: $isDestinationListPresented
                            )
                        }
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.horizontal)
            
            Button(action: {
                isGetRoutesPresented = true
            }) {
                Text("Get routes")
                    .foregroundColor(isInputCompleted ? Color.blue : Color.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(isInputCompleted ? Color(red: 235/255, green: 235/255, blue: 235/255) : Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                    .shadow(
                        color: .black.opacity(0.29),
                        radius: 4, x: 0, y: 4
                    )
            }
            .disabled(isInputCompleted)
            .sheet(isPresented: $isGetRoutesPresented) {
                GetRoutesListView(currentView: $currentView,
                                  selectedStarting: $selectedStarting,
                                  selectedDestination: $selectedDestination,
                                  selectedRoute: $selectedRoute,
                                  selectedRouteFees: $selectedRouteFees, 
                                  isSheetPresented: $isGetRoutesPresented)
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.horizontal)
        .padding(.bottom, 30)
    }
}

#Preview {
    HomeView()
}

