//
//  Pointer.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI

struct Pointer: View {
    @State var straightlineHeight: CGFloat
    
    var body: some View {
        VStack{
            Circle()
                .fill(Color.blue)
                .frame(width: 7, height: 7)
                .shadow(
                    color: .blue.opacity(0.29),
                    radius: 4,x: 0, y: 4
                )
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: 2, height: straightlineHeight)
                .cornerRadius(2.5)
                .shadow(
                    color: .black.opacity(0.29),
                    radius: 4,x: 0, y: 4
                )
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 7, height: 7)
                .cornerRadius(2)
                .shadow(
                    color: .red.opacity(0.29),
                    radius: 4,x: 0, y: 4
                )
        }
    }
}

#Preview {
    Pointer(straightlineHeight: 20)
}
