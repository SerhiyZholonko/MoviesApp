//
//  SearchMovieDetailViewViewModel.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import Foundation


final class SearchMovieDetailViewViewModel: ObservableObject {
    
    @Published var searchMovie: SearchFromResult
    @Published var title: String
    @Published var stringImage: String
    @Published var vote: Double
    @Published var popularity: Double
    @Published var overview: String
    @Published var id: Int
    init(searchMovie: SearchFromResult) {
        self.searchMovie = searchMovie
        self.title = searchMovie.title
        self.stringImage = searchMovie.posterPath ?? ""
        self.vote = searchMovie.voteAverage
        self.popularity = searchMovie.popularity
        self.overview = searchMovie.overview
        self.id = searchMovie.id
    }
    func addLikeMovie() {
        let movies: [MovieEntity] = CoreDataManager.shared.fetchData(entityName: "MovieEntity")
        for movie in movies {
            if movie.id == id {
                return
            }
        }
        let movie = MovieEntity(context: CoreDataManager.shared.managedObjectContext)
        movie.id = Int64(id)
        movie.title = title
        movie.stringUrl = stringImage
        CoreDataManager.shared.save(movie)
    }
}
