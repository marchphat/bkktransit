//
//  StationSearchList.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 15/3/2567 BE.
//

import SwiftUI

struct StationSearchList: View {
    @Binding var selectedStation: [Station]
    @Binding var currentView: ViewState
    @Binding var previousView: ViewState
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var isSheetPresented: Bool

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(selectedStation) { station in
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isSheetPresented = false
                            
                            switch currentView {
                            case .searchStartingStation:
                                selectedStarting = station
                                if selectedDestination?.stationId == selectedStarting?.stationId {
                                    selectedDestination = nil
                                }
                                previousView = .searchStartingStation
                            case .searchDestination:
                                selectedDestination = station
                                if selectedStarting?.stationId == selectedDestination?.stationId {
                                    selectedStarting = nil
                                }
                                previousView = .searchDestination
                            default:
                                print("This view state is not for searching station.")
                                break
                            }
                        }
                    
                    StationDetailsCell(station: station)
                }
                .padding(.top, 8)
                
                Divider().padding(.horizontal, 20)
            }
        }
    }
}
