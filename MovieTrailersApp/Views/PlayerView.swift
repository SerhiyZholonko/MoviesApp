//
//  PlayerView.swift
//  MovieTrailersApp
//
//  Created by apple on 12.04.2023.
//

import SwiftUI
import YouTubePlayerKit

struct PlayerView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: MovieDetailViewModel
    var body: some View {
        ZStack {
            YouTubePlayerView(viewModel.youtubeStringUrl)
            Button {
                presentationMode.wrappedValue.dismiss()

            } label: {
                VStack {
                    
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .padding(.trailing, 20)
                    }
                   
                    Spacer()
                }
               
            }


        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}



