//
//  DetaillMovieView.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import SwiftUI

struct DetaillMovieView: View {
    let movie: MovieModel
    var body: some View {
        VStack(spacing: 20){
            Image(movie.imageName)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
            Text(movie.title)
            Spacer()
        }
        .navigationTitle(movie.title)
    
    }
}

struct DetaillMovieView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetaillMovieView(movie: MovieModel(title: "Movie", imageName: "imageMovie"))
        }
       
    }
}
