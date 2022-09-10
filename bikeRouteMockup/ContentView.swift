//
//  ContentView.swift
//  bikeRouteMockup
//
//  Created by James Young on 9/9/22.
//

import SwiftUI
import CoreData
import MapKit
import CoreLocation
import Combine

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @StateObject var locationManager = LocationManager()
    
    
    var body: some View {
        Map(coordinateRegion: $locationManager.region,
            interactionModes: MapInteractionModes.pan,
            showsUserLocation: true
        )
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
                                       longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

   
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    
 

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        region = MKCoordinateRegion(
            center:lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 37.334_900,longitude: -122.009_020),
            latitudinalMeters: 750,
            longitudinalMeters: 750)
        
        print(#function, location)
    }
}

