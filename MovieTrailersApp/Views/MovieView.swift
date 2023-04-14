//
//  MovieView.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    var movie: Movie 
    var body: some View {
        VStack(spacing: 20) {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" +  movie.posterPath ) )
                .resizable()

                .frame(height: 130)

                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
            Text(movie.title)
            Spacer()
        }
    }
}


