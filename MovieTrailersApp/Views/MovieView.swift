//
//  MovieView.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import SwiftUI

struct MovieView: View {
    var movie: MovieModel
    var body: some View {
        VStack(spacing: 20) {
            Image(movie.imageName)
                .resizable()
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
            Text(movie.title)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        
        MovieView(movie: MovieModel(title: "Movie", imageName: "imageMovie"))
    }
}
