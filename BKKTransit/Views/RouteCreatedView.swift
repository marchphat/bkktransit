//
//  SwiftUIView.swift
//  skytrain-thesis
//
//  Created by Nantanat Thongthep on 13/3/2567 BE.
//

import SwiftUI
import Drawer

struct RouteCreatedView: View {
    @ObservedObject private var routeViewModel = RouteViewModel()
        
    @State private var isRouteViewShow: Bool = false
    @State private var pointerStraightHeight: CGFloat = 17
    @State private var isLiked = false
    @State private var drawerHeights = drawerDefault
    
    @Binding var selectedStarting: Station?
    @Binding var selectedDestination: Station?
    @Binding var selectedRoute: Route?
    @Binding var selectedRouteFees: Int      
    @Binding var currentView: ViewState
    
    @State private var isDrawerOpen = true

    var body: some View {
        Drawer {
            ZStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .foregroundColor(Color(.white))
                    .shadow(radius: 25)
                
                VStack {
                    Capsule()
                        .foregroundColor(Color(rgb: (235, 235, 235)))
                        .frame(width: 50, height: 7)
                        .padding(.top, 10)
                        .padding(.bottom, 14)
                    
                    HStack {
                        Button(action: {
                            currentView = .home
                        }) {
                            Text("Done")
                                .foregroundColor(Color.blue)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(selectedRouteFees) ฿")
                            .foregroundStyle(.black)
                        
                        Text("·")
                            .foregroundStyle(.black)
                        
                        Button(action: {
                            self.isLiked.toggle()
                        }) {
                            Image(systemName: isLiked ? "bookmark.fill" : "bookmark")
                                .foregroundColor(isLiked ? .red : .gray)
                                .font(.system(size: 20))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    HStack {
                        Pointer(straightlineHeight: pointerStraightHeight)
                        
                        VStack {
                            RouteViewHeader(selectedStation: $selectedStarting, stationType: "selectedStarting")
                            
                            RouteViewHeader(selectedStation: $selectedDestination, stationType: "selectedDestination")
                        }
                        .padding(.leading, 5)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.vertical, 4)
                                        
                    RouteCreated(selectedRoute: selectedRoute)
                    
                    Spacer()
                }
            }
        }
        .rest(at: $drawerHeights)
        .impact(.light)
        .ignoresSafeArea()
    }
}
