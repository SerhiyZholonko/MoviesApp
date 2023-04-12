//
//  PlayerView.swift
//  MovieTrailersApp
//
//  Created by apple on 12.04.2023.
//

import SwiftUI
import WebKit

struct PlayerView: View {
    let webView = WKWebView()
    let url = URL(string: "https://www.google.com")!
    var body: some View {
        WebView(url: url)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
