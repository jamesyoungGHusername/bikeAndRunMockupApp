//
//  bikeRouteMockupApp.swift
//  bikeRouteMockup
//
//  Created by James Young on 9/9/22.
//

import SwiftUI

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
