//
//  GraphicMapView.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 17/3/2567 BE.
//

import SwiftUI

struct GraphicMapView: View {
    @ObservedObject private var stationViewModel = StationViewModel()
    @ObservedObject private var densityViewModel = DensityViewModel()
    
    @Binding var previousView: ViewState
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    
    @State private var destination = [String]()
    @State private var selectedStation: Station?
    @State private var showingPopup = false
    
    @State private var scale: CGFloat = 0.5
    @State private var minScale: CGFloat = 0.5
    @State private var maxScale: CGFloat = 1.3
    
    private let image: UIImage = UIImage(named: "metro-map-th")!
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView([.vertical, .horizontal]) {
                ScrollViewReader { scrollViewProxy in
                    ZoomableScrollView {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: image.size.width, height: image.size.height)
                            .overlay(
                                ForEach(stationViewModel.allStations) { station in
                                    Button(action: {
                                        densityViewModel.calculateStationDensity(stationId: station.stationId,
                                                                                 stationLineColor: station.lineColor)
                                        selectedStation = station
                                        showingPopup = true
                                    }) {
                                        Circle()
                                            .frame(width: max(11 * scale, 9), height: max(11 * scale, 9))
                                            .foregroundStyle(Color.clear)
                                    }
                                    .offset(x: CGFloat(station.positionX) * image.size.width,
                                            y: CGFloat(station.positionY) * image.size.height)
//                                    .onReceive(densityViewModel.$stationDensity.dropFirst()) { _ in
//                                        showingPopup = true
//                                    }
                                }
                            )
                    }
                    .frame(width: max(geometry.size.width, image.size.width), height: max(geometry.size.height, image.size.height))
                    .onAppear {
                        scrollViewProxy.scrollTo(image, anchor: .center)
                    }
                    .id(image)
                }
            }
        }
        .background(Color(rgb: (246, 246, 246)))
        .edgesIgnoringSafeArea(.all)
        .alert(selectedStation?.name ?? "Station not found.", isPresented: $showingPopup) {
            Button("Starting Station") {
                selectedStarting = selectedStation
                if selectedDestination?.stationId == selectedStarting?.stationId {
                    selectedDestination = nil
                }
            }
            Button("Destination") {
                selectedDestination = selectedStation
                if selectedStarting?.stationId == selectedDestination?.stationId {
                    selectedStarting = nil
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            if let density = densityViewModel.stationDensity {
                Text("Currently \(density.stationDensity) crowding")
            }
//            StationCrowdingView(stationDensity: densityViewModel.stationDensity)
        }
    }
}

//struct StationCrowdingView: View {
//    @State var stationDensity: StationDensity?
//    
//    var body: some View {
//        if let text = stationDensity {
//            var emoji: String = ""
//            let density = DensityStatus(rawValue: text.stationDensity)
//
//            switch density {
//            case .low:
//                emoji = "😄"
//            case .medium:
//                emoji = "😟"
//            case .high:
//                emoji = "😨"
//            case .none:
//                return Text("Crowding information not available")
//            }
//            
//            return Text("Currently \(text.stationDensity) \(emoji) crowding")
//        } else {
//            return Text("Crowding information not available")
//        }
//    }
//}

#Preview {
    HomeView()
}

//struct GraphicMap: Identifiable {
//    let id: Int
//    let name: String
//    let position: CGPoint
//    let color: Color
//}


//private let stations: [GraphicMap] = [
//    GraphicMap(id: 1,
//               name: "RN10 Rangsit",
//               position: CGPoint(x: -0.003, y: 0.0445),
//               color: .blue),
//    GraphicMap(id: 2,
//               name: "RN09 Lak Hok",
//               position: CGPoint(x: 0.049, y: 0.0445),
//               color: .green),
//    GraphicMap(id: 3,
//               name: "RN08 Don Muang",
//               position: CGPoint(x: 0.101, y: 0.0445),
//               color: .red),
//    GraphicMap(id: 4,
//               name: "RN08 Don Muangq",
//               position: CGPoint(x: 0.213, y: 0.0445),
//               color: .yellow),
//    GraphicMap(id: 5,
//               name: "RN08 Don Muang",
//               position: CGPoint(x: 0.319, y: 0.0445),
//               color: .pink),
//    GraphicMap(id: 6,
//               name: "RN08 Don Muang",
//               position: CGPoint(x: 0.379, y: 0.0445),
//               color: .purple),
//    GraphicMap(id: 7,
//               name: "RN08 Don Muang",
//               position: CGPoint(x: 0.438, y: 0.0445),
//               color: .brown),
//    GraphicMap(id: 8,
//               name: "RN08 Don Muang",
//               position: CGPoint(x: 0.455, y: 0.077),
//               color: .cyan)
//]
