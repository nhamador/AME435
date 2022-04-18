//
//  ContentView.swift
//  Location App
//
//  Created by student on 3/21/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            Section {
                NavigationLink(destination: ListView()) {
                    Text("List")
                        .padding()
                }
            }
        }
    }
}





    /*
    @EnvironmentObject var favList: FavList
    @StateObject var faverList = FavList()
    @EnvironmentObject var locationController: LocationController
    
    //var davList = UserDefaults.standard.object(forKey: "fav")

    var body: some View {
        
        NavigationView {
            List{
                ForEach(faverList.items){ item in
                    HStack {
                        NavigationLink(destination: DetailView(item: item, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude), latitudinalMeters: 750,
                                                                                                      longitudinalMeters: 750)))
                        {
                            Text(item.name)
                        }
                        Spacer()
                    }
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: move)
                //may edit name in detail view?
            }
            .navigationTitle("Favorites")
            .listStyle(GroupedListStyle())
            .toolbar{
                EditButton()
            }
            .onAppear(perform: {//after adding this black screen at launch
                //faverList.archiveFavs()
                //faverList.refresh()
                faverList.archiveFavs()
                
            })
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environmentObject(FavList)
            //.environmentObject(LocationController())
    }
}
     */
