//
//  RouteDetailsCell.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 15/3/2567 BE.
//

import SwiftUI

struct RouteDetailsCell: View {
    @State private var image_name: String = "questionmark-logo"
    var station: Station
    
    var body: some View {
        HStack {
            //MARK: - Station Logo
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 45, height: 45)
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(.gray.opacity(0.2), lineWidth: 4)
                    )
                
                Image(image_name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            
            //MARK: - Station Details
            VStack(alignment: .leading) {
                HStack {
                    Text(station.stationId ?? "ID not found.")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
                Text(station.name ?? "Station not found.")
                    .font(.body)
                    .lineLimit(1)
                    .foregroundColor(.black)
                
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onAppear {
            switch station.line {
            case "bts":
                image_name = "bts-logo"
            case "mrt":
                image_name = "mrt-logo"
            case "arl":
                image_name = "arl-logo"
            default:
                image_name = "questionmark-logo"
            }
        }
        
    }
}

#Preview {
    RouteDetailsCell(station: Station(stationId: "BL01", name: "Hua Mak", line: "bts", lineColor: "red", isExtended: true, startTime1: "06:01", startTime2: "06:01", startTime3: "06:01", startTime4: "06:01", lastTime1: "06:01", lastTime2: "06:01", lastTime3: "06:01", lastTime4: "06:01", positionX: 022.222, positionY: 02.222, latitude: 0.222, longitude: 0.222))
}
