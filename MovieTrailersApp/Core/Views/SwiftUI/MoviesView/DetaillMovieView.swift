//
//  DetaillMovieView.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetaillMovieView: View{
    @StateObject var viewModel: MovieDetailViewModel

    @State var isPresent: Bool = false

    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                VStack{
                    ZStack{
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + viewModel.stringBagroundImage))
                            .resizable()
                            .cornerRadius(10)
                            .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
                            .padding(.trailing, 20)
                            .padding(.bottom, 20)
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
                                .environmentObject(viewModel)
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    viewModel.addLike()
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.pink)
                                }

                            }
                        }
                    }
                    .frame( height: 200)

                }
                VStack(spacing: 20){
                    HStack{
                        ZStack {
                            
                        
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + viewModel.stringUrl))
                            .resizable()
                            .frame(width: 150, height: 200)
                            .cornerRadius(10)
                            .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 20)
                   
                    }
                        VStack(alignment: .leading, spacing: 8){
                            Spacer()
                                .frame(height: 5)
                            Text(viewModel.title)
                                .foregroundColor(.blue)
                                .font(.title2)
                            VStack(alignment: .leading, spacing: 4){
                                HStack(spacing: 0) {
                                    Text(viewModel.voluteCount)
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                                Text(viewModel.reliseDate)
                            }
                            .foregroundColor(.gray)
                            .font(.body)

                        }
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("overview".uppercased())
                            .padding(4)
                            .background{
                                Color.blue.opacity(0.2)
                            }
                            .foregroundColor(.gray)
                            .font(.callout)
                        Text(viewModel.description)
                            .padding(5)
                            .background{
                                Color.gray.opacity(0.2)
                            }
                            .border(.blue)

                    }
                }
                .offset(CGSize(width: 0, height: -60))
                Spacer()
                
            }
            .padding(.horizontal, 10)
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
        }
      
    }
}

