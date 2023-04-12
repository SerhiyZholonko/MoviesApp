//
//  MovieModel.swift
//  testGridView
//
//  Created by apple on 11.04.2023.
//

import Foundation


struct MovieModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let imageName: String
}
