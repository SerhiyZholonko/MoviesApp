//
//  ContentView.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(viewModel.moviews) { item in
                            NavigationLink {
                                DetaillMovieView(movie: item)
                            } label: {
                                MovieView(movie: item)
                                    .frame(width: geometry.size.width / 2 - 15, height: 200)
                            }
                            
                        }
                    
                }
                .padding()
                .onAppear{
                    viewModel.setupMovies()
                }
                
            }
        }
        .navigationTitle("Movies")


    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoviesView()
                .navigationTitle("Movies")
                .environmentObject(MovieViewModel())
        }
        
    }
}
