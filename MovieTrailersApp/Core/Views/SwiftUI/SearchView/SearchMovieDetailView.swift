//
//  SearchMovieDetailView.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchMovieDetailView: View {
    @State var viewModel: SearchMovieDetailViewViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack {
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + viewModel.stringImage))
                        .resizable()
                        .cornerRadius(10)
                        .padding(20)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                viewModel.addLikeMovie()
                            } label: {
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    
                }
                    .frame( height: 200)
                    .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
                    .padding(.top, 20)
                Text(viewModel.title)
                    .font(.title3)
                Text("Overview".uppercased())
                    .font(.callout)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text(viewModel.overview)
                    .padding(10)
                    .background {
                        Color.gray.opacity(0.2)
                    }
                    .border(.blue)
                Spacer()
            }
            .padding()
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


