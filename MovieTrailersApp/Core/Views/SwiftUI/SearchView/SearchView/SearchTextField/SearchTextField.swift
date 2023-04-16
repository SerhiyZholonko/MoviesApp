//
//  SearchTextField.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var searchText: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.blue, lineWidth: 1)
            TextField("Search..", text: $searchText)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(6)
              
        }
        .frame(maxWidth: .infinity)
        .frame(height: 55)
    }
}


