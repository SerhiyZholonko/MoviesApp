//
//  SettingsViewViewModel.swift
//  MovieTrailersApp
//
//  Created by apple on 16.04.2023.
//

import UIKit


final class SettingsViewViewModel: ObservableObject {
    @Published var isShowingImagePicker: Bool = false
    @Published var user: UserModel = .init(name: "", email: "", image: nil) {
        didSet {
            guard user.name != "", user.email != "", user.image != nil else { return }
            let newUser = UserEntity(context: CoreDataManager.shared.managedObjectContext)
            newUser.image = user.image?.pngData()
            newUser.name = user.name
            newUser.email = user.email
            CoreDataManager.shared.deleteAllEntities(entityName: "UserEntity")
            CoreDataManager.shared.save(newUser)
            
        }
    }
    @Published var name: String = "" {
        didSet {
           let newUser = self.user.updateUserName(name: name)
            self.user = newUser
            print(user)
        }
    }
    @Published var email: String = "" {
        didSet {
           let newUser = self.user.updateUserEmail(email: email)
            self.user = newUser
            print(user)
        }
    }
    @Published var image: UIImage? = nil {
        didSet {
            guard let image = image else { return }
            let newUser = self.user.updateUserImage(image: image)
            self.user = newUser
            print(user)
        }
    }
    init() {
       setupData()
        
    }
    private func setupData() {
        let dataUser: [UserEntity] = CoreDataManager.shared.fetchData(entityName: "UserEntity")
        guard let user = dataUser.first else {return}
         name = user.name ?? ""
        email = user.email ?? ""
        guard let userImage = user.image else { return }
        image = UIImage(data: userImage )
    }
}
