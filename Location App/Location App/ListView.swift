//
//  ListView.swift
//  Location App
//
//  Created by student on 4/16/22.
//

import SwiftUI
import MapKit

struct ListView: View {
    @StateObject var favStorage: FavList = FavList()
    var body: some View {
        
        NavigationView {
            List{
                ForEach($favStorage.favorites){ $favorite in
                    HStack {
                        NavigationLink(destination: DetailView(item: favorite, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: favorite.latitude, longitude: favorite.longitude), latitudinalMeters: 750,
                                                                                                      longitudinalMeters: 750)))
                        {
                            Text(favorite.name)
                        }
                        Spacer()
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                //may edit name in detail view?
            }
            .navigationTitle("Favorites")
            .listStyle(GroupedListStyle())
            .toolbar{
                EditButton()
            }
            .onAppear(perform:
            {
            favStorage.refresh()
            })
        }
    }
    func delete(at offsets: IndexSet)
    {
        favStorage.favorites.remove(atOffsets: offsets)
        favStorage.archiveFavs()
        favStorage.refresh()
    }
    
    func move(from source: IndexSet, to destination: Int)
    {
        favStorage.favorites.move(fromOffsets: source, toOffset: destination)
        favStorage.archiveFavs()
        favStorage.archiveFavs()
    }
}
