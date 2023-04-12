//
//  MovieViewModel.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import Foundation


final class MovieViewModel: ObservableObject {
    @Published var moviews: [MovieModel] = []
    
    private let collectionMovies: [MovieModel] = [
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
        MovieModel(title: "Movie", imageName: "imageMovie"),
    ]
    func setupMovies() {
        moviews.append(contentsOf: collectionMovies)
    }
}
