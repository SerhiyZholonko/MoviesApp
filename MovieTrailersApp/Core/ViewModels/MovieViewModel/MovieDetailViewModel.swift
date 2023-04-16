//
//  MovieDetailView.swift
//  MovieTrailersApp
//
//  Created by apple on 12.04.2023.
//

import SwiftUI
import Alamofire
import Combine
import YouTubePlayerKit


final class MovieDetailViewModel: ObservableObject {
    @Published var detailMovie: Movie
    @Published var id: Int {
        didSet {
            parseJson()
        }
    }
    @Published var title: String = ""
    @Published var stringUrl: String = ""
    @Published var stringBagroundImage: String = ""
    @Published var description = ""
    @Published var youtubeStringUrl: YouTubePlayer = "https://youtube.com/watch?v=psL_5RIBqnY"
    @Published var voluteCount: String = ""
    @Published var reliseDate: String = ""

    init(detailMovie: Movie) {
        self.detailMovie = detailMovie
        title = detailMovie.title
        stringUrl = detailMovie.posterPath
        stringBagroundImage = detailMovie.backdropPath
        description = detailMovie.overview
        voluteCount =  "Vote: \(detailMovie.voteAverage) "
        reliseDate =  "Date relise: "+detailMovie.releaseDate
        id = detailMovie.id
        parseJson()
    }
//TODO: -  loadmanager
    func parseJson() {
        AF.request("https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(Constants.share.apiKey)&language=en-US")
                       .validate()
                       .responseDecodable(of: YoutubeVideoModel.self) { [weak self] response in
                           switch response.result {
                           case .success(let curentResult):
                               print("TEST: ",curentResult)
                               if let last = curentResult.results.last {
                                   self?.youtubeStringUrl =   YouTubePlayer(stringLiteral: "https://www.youtube.com/watch?v=\(last.key)")

                               }
                           case .failure(let error):
                               print(error.localizedDescription)
                           }
                       }
    }
    func addLike() {
        let movies: [MovieEntity] = CoreDataManager.shared.fetchData(entityName: "MovieEntity")
        for movie in movies {
            if movie.id == id {
                return
            }
        }
        let movie = MovieEntity(context: CoreDataManager.shared.managedObjectContext)
        movie.id = Int64(id)
        movie.title = title
        movie.stringUrl = stringUrl
        CoreDataManager.shared.save(movie)
    }
}
