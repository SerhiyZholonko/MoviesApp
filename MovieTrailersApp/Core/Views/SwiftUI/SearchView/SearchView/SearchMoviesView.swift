//
//  searchMoviesView.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI

struct SearchMoviesView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(viewModel.movies, id: \.id ) { searchMovie in
                    NavigationLink(destination:
                                    SearchMovieDetailView(viewModel: SearchMovieDetailViewViewModel(searchMovie: searchMovie))
                    ){
                        SearchMovieView(searchMovie: searchMovie)
                            .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 200)
                            .environmentObject(viewModel)
                    }
                }
                
            }
            .padding()
        }
    }
}


