//
//  MainTabBar.swift
//  MovieTrailersApp
//
//  Created by apple on 11.04.2023.
//

import SwiftUI

struct MainTabBar: View {
    @StateObject var viewModel = MovieViewModel()
    init() {
          UITabBar.appearance().backgroundColor = UIColor.white
      }
    var body: some View {
            TabView {
                            NavigationView {
                                MoviesView()
                                    .environmentObject(viewModel)
                            }
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                NavigationView {
                    SearchView()
                }
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                NavigationView {
                    FavoriteView()
                }
                    .tabItem {
                        Label("Likes", systemImage: "heart")
                    }
                NavigationView {
                    SettingsView()
                }
                        .tabItem {
                            Label("Settings", systemImage: "gearshape")
                        }
                
    
            }
            .background(Color.blue)


    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
