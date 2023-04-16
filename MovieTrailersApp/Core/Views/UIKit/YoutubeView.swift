//
//  YoutubeView.swift
//  MovieTrailersApp
//
//  Created by apple on 14.04.2023.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let videoId: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}

struct CollectionView: View {
    var ids = ["xxxxxxxxx", "xxxxxxxxxx", "xxxxxxxxx"]
    var body: some View {
        ZStack {
            Image("cover")
                .resizable().opacity(0.2)
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Demo")
                        .font(.title)

                    ForEach(ids, id:\.self) {idData in
                        YouTubeView(videoId: idData)
                            .frame(width: 300, height: 300)
                            .padding()
                    }

                }
            }

        }
    }
}
