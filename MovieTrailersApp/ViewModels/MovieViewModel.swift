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

//    @Published var title: String = ""
//    @Published var stringUrl: String = ""
//    @Published var stringBagroundImage: String = ""
//    @Published var description = ""
    init() {
        parseJson()
    }
    func parseJson() {
        AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=" + Constants.share.apiKey + "&language=en-US&page=1")
                       .validate()
                       .responseDecodable(of: Movies.self) { response in
                           switch response.result {
                           case .success(let movie):
                               self.moviews = movie.results
                           case .failure(let error):
                               print(error.localizedDescription)
                           }
                       }
    }
//    func parseJsonDetail() {
//        AF.request("https://api.themoviedb.org/3/movie/"+"\(id)"+"?api_key="+Constants.share.apiKey+"&language=en-US")
//                       .validate()
//                       .responseDecodable(of: DetailMovie.self) { response in
//                           switch response.result {
//                           case .success(let movie):
//                               print(movie)
////                               self.objectWillChange.send(self.detailMovie!.self)
//
//                           case .failure(let error):
//                               print(error.localizedDescription)
//                           }
//                       }
//    }
    
}
