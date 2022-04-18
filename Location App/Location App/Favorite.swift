//
//  Favorite.swift
//  Location App
//
//  Created by student on 3/22/22.
//

import SwiftUI
import MapKit
struct Favorite: Identifiable, Codable{
    let id: UUID?
    var name: String
    var longitude: Double
    var latitude: Double
    var description: String
    init(name: String, longitude: Double, latitude: Double, description: String){
        id = UUID()
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.description = description
    }
}
