//
//  MovieDetailView.swift
//  MovieTrailersApp
//
//  Created by apple on 12.04.2023.
//

import SwiftUI


final class MovieDetailViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var stringUrl: String = ""
    @Published var stringBagroundImage: String = ""
    @Published var description = ""
    @State  var isPlayer: Bool = false

    init(movie: Movie){
        self.title = movie.title
        self.stringUrl = movie.posterPath
        self.stringBagroundImage = movie.backdropPath
        self.description = movie.overview
    }
    public func isPlayerChange() {
       isPlayer.toggle()
    }
}
