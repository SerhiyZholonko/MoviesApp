//
//  FavoriteView.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var viewModel = FavoriteViewViewModel()

    var body: some View {
            List {
                ForEach(viewModel.movies) { movie in
                    FavoriteCellView(favoriteMovie: movie)
                }
                .onDelete(perform: viewModel.deleteItem)
            }
        .navigationTitle("Favorite")
        .onAppear{
            viewModel.fechData()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
