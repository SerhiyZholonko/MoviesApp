//
//  DetailMovieModel.swift
//  MovieTrailersApp
//
//  Created by apple on 13.04.2023.
//

import Foundation


final class DetailMovieModel {
    let title: String
    let stringImage: String
    init(detailMovie: Movie) {
        self.title = detailMovie.title
        self.stringImage = detailMovie.posterPath
    }
}
