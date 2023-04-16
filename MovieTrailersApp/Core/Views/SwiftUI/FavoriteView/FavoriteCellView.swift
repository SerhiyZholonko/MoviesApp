//
//  FavoriteCellView.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteCellView: View {
var favoriteMovie: MovieEntity
    var body: some View {
        VStack {
            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" +  (favoriteMovie.stringUrl ?? "") ) )
                .resizable()
                .frame(height: 130)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
                .padding(.horizontal, 20)
            Text(favoriteMovie.title ?? "")
        }
        .padding()
    }
}

