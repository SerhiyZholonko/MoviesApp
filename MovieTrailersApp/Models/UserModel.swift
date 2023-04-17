//
//  UserModel.swift
//  MovieTrailersApp
//
//  Created by apple on 16.04.2023.
//

import UIKit

struct UserModel {
    let name: String
    let email: String
    let image: UIImage?
    
    func updateUserName(name: String) -> UserModel {
        return UserModel(name: name, email: email, image: image)
    }
    func updateUserEmail(email: String) -> UserModel {
        return UserModel(name: name, email: email, image: image)
    }
    func updateUserImage(image: UIImage) -> UserModel {
        return UserModel(name: name, email: email, image: image)
    }
}
