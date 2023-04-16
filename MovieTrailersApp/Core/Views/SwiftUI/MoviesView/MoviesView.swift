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
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(viewModel.moviews, id: \.id ) { movie in
                    NavigationLink(destination: DetaillMovieView(viewModel: MovieDetailViewModel(detailMovie: movie))
                            .environmentObject(viewModel)
                        ){
                            MovieView(movie: movie)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 200)
                                .environmentObject(viewModel)
                                .onAppear {
                                    viewModel.loadNextPage(currentItem: movie)
                                }
                        }
                }
            }
            .padding()
        }
        .navigationTitle("Movies")
    }
}
