//
//  RouteViewHeader.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 15/3/2567 BE.
//

import SwiftUI

struct RouteViewHeader: View {
    @Binding var selectedStation: Station?
    var stationType: String
    
    private var textColor: Color {
        switch stationType {
        case "selectedStarting":
            return Color.black
        case "selectedDestination":
            return Color.accentColor
        default:
            return Color.black
        }
    }
    
    var body: some View {
        HStack {
            Text(stationType == "selectedStarting" ? "From" : "To")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .frame(width: 40, alignment: .leading)
            
            Text(selectedStation?.name ?? "Station not found.")
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(textColor)
                .frame(height: 30)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
