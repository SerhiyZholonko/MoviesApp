//
//  SearchView.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        ZStack {
            VStack {
                SearchTextField(searchText: $viewModel.searchText)
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                SearchMoviesView()
                    .environmentObject(viewModel)
                .navigationTitle("Search")
            }
            Text("Enter movie name 🙂")
                .opacity(viewModel.isEmptySearch ? 1 : 0)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(SearchViewModel())
    }
}
