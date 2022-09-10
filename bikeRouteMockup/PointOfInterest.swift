//
//  PointOfInterest.swift
//  bikeRouteMockup
//
//  Created by James Young on 9/9/22.
//

import Foundation
import MapKit

struct PointOfInterest:Identifiable{
    let id = UUID()
    let name:String
    let lat:Double
    let lon:Double
    
    var coord:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
