//
//  bikeRouteMockupApp.swift
//  bikeRouteMockup
//
//  Created by James Young on 9/9/22.
//

import SwiftUI
import UIKit
import CoreLocation

// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        return true
    }
}

@main
struct bikeRouteMockupApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
