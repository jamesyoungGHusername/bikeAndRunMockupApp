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
        ).allowsHitTesting(false)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


