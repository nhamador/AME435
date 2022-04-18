//
//  DetailView.swift
//  Location App
//
//  Created by student on 3/23/22.
//

import SwiftUI
import MapKit

struct DetailView: View{
    @EnvironmentObject var locationController: LocationController
    @EnvironmentObject var favList: FavList
    var item: Favorite
    @State var region: MKCoordinateRegion
    var  body: some View
    {
        VStack
        {
            HStack
            {
                Text(item.name)
                    .font(.system(size: 24))
                Spacer()
            }
            .padding(8)
            /*
            HStack
            {
                Text("Longitude: \(item.longitude)")
                    .font(.system(size: 18))
                Text("Latitude: \(item.latitude)")
                    .font(.system(size: 18))
            }
             */
             
            HStack
            {
                Text(item.description)
                    .font(.system(size: 18))
            }
            .padding(.leading)
            HStack
            {
            }
            .padding(.leading)
            Map(coordinateRegion: $region)
        }
        .onAppear(perform:
        {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: item.latitude,
                                               longitude: item.longitude),
                    latitudinalMeters: 750,
                    longitudinalMeters: 750
                )
            locationController.requestPermission()
        })
    }
    }
    

