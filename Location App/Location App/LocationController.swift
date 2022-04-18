//
//  LocationController.swift
//  Location App
//
//  Created by student on 3/21/22.
//

import Foundation
import CoreLocation
import MapKit

class LocationController: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager: CLLocationManager
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.812029, longitude: -117.919006), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)) //should be something else at start 
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    func start() {
        locationManager.startUpdatingLocation()
    }
    func stop(){
        locationManager.stopUpdatingHeading()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let newLocation = locations.last {
            region.center = newLocation.coordinate
        }
        stop()
    }
    func geocodeLocation(text: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                if let error = error {
                    print(error.localizedDescription)
                }
                print("Unable to find \(text)")
                return
            }
            
            if response.mapItems.isEmpty {
                return
            }
            if let item = response.mapItems.first, let location = item.placemark.location {
                self.region.center = location.coordinate
            }
        }
    }
}
