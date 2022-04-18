//
//  MapView.swift
//  Location App
//
//  Created by student on 3/21/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationController: LocationController
    //@Published var favoriteList = [Favorite]()
    @StateObject var favList: FavList = FavList()
    
    @State var locationA: String = "Sun Devil Stadium"
    @State var name: String = ""
    @State var description: String = ""
    

    
    var body: some View{
        VStack
        {
            HStack {
                Button(action: {
                    if
                        CLLocationManager
                        .locationServicesEnabled(){
                            locationController.start()
                    }
                }) {
                    HStack {
                        Image(systemName: "location")
                        Text("Device Location")
                    }
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(8)
                }
                Text("\(locationController.region.center.latitude) \(locationController.region.center.longitude)")
                Spacer()
            }
            .padding(.leading)
            HStack
            {
                Button(action: {
                    locationController.geocodeLocation(text: locationA)
                }) {
                    HStack {
                        Image(systemName: "location")
                            .font(.body)
                        Text("Find")
                            .font(.body)
                    }
                    .padding(8.0)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                }
                TextField("Enter location", text: $locationA)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.leading)
            Map(coordinateRegion: $locationController.region)
            Button(action: {
                //add to favorites
                let favLong = locationController.region.center.longitude;
                let favLat = locationController.region.center.latitude;
                let favLocation = Favorite(name: name, longitude: favLong, latitude: favLat, description: "")
                favList.add(item: favLocation)
                favList.archiveFavs()
                //favList.items.append(favLocation)
               // favList.archiveFavs()
            }){
                HStack{
                    Image(systemName: "favorites")
                        .font(.body)
                    Text("Add to favorites")
                        .font(.body)
                }
                .padding(8.0)
                .foregroundColor(.white)
                .background(Color.pink)
                .cornerRadius(8)
            }
            TextField("Enter Name", text: $name)
                .textFieldStyle(.roundedBorder)
            TextField("Enter Description", text: $description)
                .textFieldStyle(.roundedBorder)
        }
        .onAppear(perform: {
            locationController.requestPermission()
        })
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationA: "Sun Devil Stadium")
            .environmentObject(LocationController())
            //.environmentObject(FavList)
    }
}
