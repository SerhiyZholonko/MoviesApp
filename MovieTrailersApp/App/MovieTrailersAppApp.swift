//
//  MovieTrailersAppApp.swift
//  MovieTrailersApp
//
//  Created by apple on 11.04.2023.
//

import SwiftUI

@main
struct MovieTrailersAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabBar()
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
