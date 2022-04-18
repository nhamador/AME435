//
//  LocationSUIApp.swift
//  LocationSUI
//
//  Created by student on 3/14/22.
//

import SwiftUI

@main
struct LocationSUIApp: App {
    
    @StateObject private var locationManager = LocationManager()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
