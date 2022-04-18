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
    
    var item: Favorite //do I use binding??
    //@Binding var region: MKCoordinateRegion
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
                Text("\(item.latitude)")
                    .font(.system(size: 18))
                Text("\(item.latitude)")
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
    

