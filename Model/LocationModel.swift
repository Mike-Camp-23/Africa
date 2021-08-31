//
//  LocationModel.swift
//  Africa
//
//  Created by Michael Camp on 4/13/21.
//

import Foundation
import MapKit


struct NationalParkLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed Properites
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
