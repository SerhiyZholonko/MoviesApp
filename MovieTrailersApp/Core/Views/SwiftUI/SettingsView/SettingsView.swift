//
//  SettingsView.swift
//  MovieTrailersApp
//
//  Created by apple on 16.04.2023.
//

import SwiftUI
import StoreKit



struct SettingsView: View {
    @StateObject var viewModel = SettingsViewViewModel()
    @Environment(\.requestReview) var requestReview

    var body: some View {
        VStack(spacing: 20) {
                Button(action: {
                    viewModel.isShowingImagePicker = true
                }) {
                    if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .cornerRadius(100)
                            .shadow(color: .blue.opacity(0.3), radius: 20, x: 0, y: 30)

                    } else {
                        Image(systemName: "person.badge.plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .font(.system(size: 120))
                            .frame(width: 200, height: 200)
                    }
                }
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Name ")
                            .foregroundColor(.gray)
                    
                    }
                    HStack {
                        Text("Email ")
                            .foregroundColor(.gray)
                    }
                }
                VStack {
                    HStack {
                        Divider()

                    }
                    .frame(height: 20)

                    HStack {
                        Divider()

                    }
                    .frame(height: 20)

                }
                VStack {
                    TextField("Enter your name", text: $viewModel.name)
                    TextField("Enter your email", text: $viewModel.email)
                }
            }
            .padding(.horizontal)
            Divider()
            Spacer()
                .frame(height: 50)
        }
            VStack(spacing: 10) {
                Button {
                    requestReview()
                } label: {
                    Text("Rate us")
                }
                Divider()
                Button {
                    if let emailUrl = URL(string: "mailto:serhiizholonko@gmail.com") {
                       UIApplication.shared.open(emailUrl)
                     }
                } label: {
                    Text("Email support")
                }

                
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .foregroundColor(.gray)
            .cornerRadius(10)
            .padding(40)

            Spacer()
                .navigationTitle("Profile")
    }
        .sheet(isPresented: $viewModel.isShowingImagePicker, content: {
            PhotoPicker(image: $viewModel.image)
        })
        .padding(.top, 20)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
