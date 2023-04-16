//
//  MovieViewModel.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import Foundation
import Alamofire


final class MovieViewModel: ObservableObject {
    @Published var moviews: [Movie] = []
    private var currentPage = 1

    init() {
        loadMovies(page: currentPage)
    }

    func loadMovies(page: Int) {
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=" + Constants.share.apiKey + "&language=en-US&page=\(page)")
            .validate()
            .responseDecodable(of: Movies.self) { response in
                switch response.result {
                case .success(let movie):
                    if page == 1 {
                        self.moviews = movie.results
                    } else {
                        self.moviews += movie.results
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }

    func loadNextPage(currentItem: Movie?) {
        guard let currentItem = currentItem else {
            return
        }
        let currentIndex = self.moviews.firstIndex(where: { $0.id == currentItem.id }) ?? 0
        let thresholdIndex = self.moviews.index(self.moviews.endIndex, offsetBy: -5)
        if currentIndex == thresholdIndex {
            currentPage += 1
            loadMovies(page: currentPage)
        }
    }
}
