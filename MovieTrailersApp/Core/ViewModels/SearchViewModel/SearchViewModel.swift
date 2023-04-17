//
//  SearchViewModel.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import Foundation
import Alamofire

final class SearchViewModel: ObservableObject {
    @Published var isEmptySearch: Bool = true
    @Published var searchText: String = "" {
        didSet {
            parseJson()
        }
    }
    @Published var movies: [SearchFromResult] = [] {
        didSet {
            isEmptySearch = movies.count > 0 ? false : true
        }
    }
    func parseJson() {
        let searchText = self.searchText.replacingOccurrences(of: " ", with: "+")
        AF.request("https://api.themoviedb.org/3/search/movie?api_key=\(Constants.share.apiKey)&query=\(searchText)")
                       .validate()
                       .responseDecodable(of: SearchResult.self) { [ weak self ] response in
                           switch response.result {
                           case .success(let movie):
                               DispatchQueue.main.async {
                                   self?.movies = movie.results
                               }
                           case .failure(let error):
                               print(error.localizedDescription)
                           }
                       }
    }
}
