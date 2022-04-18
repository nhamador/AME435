//
//  MainView.swift
//  Location App
//
//  Created by student on 3/21/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem{
                    Label("Favorites", systemImage: "list.dash")
                }
            MapView()
                .tabItem{
                    Label("Map", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
