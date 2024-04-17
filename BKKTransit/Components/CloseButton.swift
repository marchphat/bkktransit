//
//  CloseButton.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI

struct CloseButton: View {
    @Binding var isSheetPresented: Bool

    var body: some View {
        Button(action: {
            isSheetPresented = false
        }) {
            CircleClostButton()
        }
    }
}

struct CircleClostButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(Color(rgb: (231, 231, 231)))
            
            Image(systemName: "xmark")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(Color(rgb: (108, 108, 108)))
        }
    }
}
