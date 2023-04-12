//
//  DetaillMovieView.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetaillMovieView: View {
    let viewModle: MovieDetailViewModel
    @State var isPresent: Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                VStack{
                    ZStack{
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + viewModle.stringBagroundImage))
                            .resizable()
                            .frame( height: 200)
                            .cornerRadius(10)
                            .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
                        
                        Button {
                            self.isPresent.toggle()
                        } label: {
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                        }
                        .sheet(isPresented: $isPresent) {
                            PlayerView()
                        }

                       

                       
                    }
                }
                VStack(spacing: 20){
                    HStack{
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + viewModle.stringUrl))
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(10)
                            .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
                        
                        Text(viewModle.title)
                        Spacer()
                        
                    }
                    
                    Text(viewModle.description)
                }
                .offset(CGSize(width: 0, height: -60))

                
                Spacer()
                
                
                
                
                
                
            }
            .padding(.horizontal, 10)
            .navigationTitle(viewModle.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetaillMovieView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            DetaillMovieView(movie: MovieModel(title: "Movie", imageName: "imageMovie"))
        }
       
    }
}
