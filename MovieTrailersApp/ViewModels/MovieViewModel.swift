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
    init() {
        parseJson()
    }
    func parseJson() {
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=" + Constants.share.apiKey + "&language=en-US&page=1")
                       .validate()
                       .responseDecodable(of: Movies.self) { response in
                           switch response.result {
                           case .success(let post):
                               self.moviews = post.results
                               print("DEBAG: ",post)
                           case .failure(let error):
                               print(error.localizedDescription)
                           }
                       }
    }
}
