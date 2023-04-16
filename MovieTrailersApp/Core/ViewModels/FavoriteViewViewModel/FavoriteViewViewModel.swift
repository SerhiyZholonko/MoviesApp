//
//  FavoriteViewViewModel.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import Foundation


final class FavoriteViewViewModel: ObservableObject {
    @Published var movies: [MovieEntity] = []

    func fechData() {
        movies = CoreDataManager.shared.fetchData(entityName: "MovieEntity")
    }
    func deleteItem(index: IndexSet) {
        let object = movies[Int(index.first ?? 0)]
        CoreDataManager.shared.delete(object)
        
   }
}
