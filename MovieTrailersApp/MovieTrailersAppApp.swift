//
//  MovieTrailersAppApp.swift
//  MovieTrailersApp
//
//  Created by apple on 11.04.2023.
//

import SwiftUI

@main
struct MovieTrailersAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
