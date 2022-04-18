//
//  LocationManager.swift
//  LocationSUI
//
//  Created by student on 3/14/22.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager: CLLocationManager
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.424564, longitude: -111.937047), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    override init() {
        locationManager = CLLocationManager()
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    func start(){
        locationManager.startUpdatingLocation()
    }
    func stop(){
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let newLocation = locations.last {
            region.center = newLocation.coordinate
        }
        stop()
    }
}
