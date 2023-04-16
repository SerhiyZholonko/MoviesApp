//
//  SearchMovieView.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchMovieView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    var searchMovie: SearchFromResult
    var body: some View {
        VStack(spacing: 20) {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" +  (searchMovie.posterPath ?? "") ) )
                .resizable()

                .frame(height: 130)

                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
            Text(searchMovie.title)
            Spacer()
        }
    }
}
