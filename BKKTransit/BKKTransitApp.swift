//
//  BKKTransitApp.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 24/3/2567 BE.
//

import SwiftUI

@main
struct BKKTransitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
