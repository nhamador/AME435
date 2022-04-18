//
//  Location_AppApp.swift
//  Location App
//
//  Created by student on 3/21/22.
//

import SwiftUI

@main
struct Location_AppApp: App
{
    
    @StateObject private var locationController = LocationController()
    let decoder = Decoder.self
    @StateObject private var favList = FavList()
    
   

    
    var body: some Scene
    {
        WindowGroup
        {
            MainView()
                .environmentObject(locationController)
                .environmentObject(favList)
                
        }
    }
}
