//
//  ContentView.swift
//  LocationSUI
//
//  Created by student on 3/14/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    
   // @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.424564, longitude: -111), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    
    var body: some View {
        VStack{
            HStack {
                Button(action: { //what happens
                    locationManager.start()
                }, label: { //what we see
                    
                })
                HStack {
                    Image(systemName: "location")
                    Text("Device Location")
                }
                .padding(8)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(8)
            }
            Text("\(locationManager.region.center.latitude)\(locationManager.region.center.longitude)")
                Spacer()
                .padding(.leading)
            Map(coordinateRegion: $locationManager.region)

        }
        .onAppear(perform: {
            
        })
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}
