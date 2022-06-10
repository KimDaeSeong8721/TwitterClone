//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/19.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage? // uikit
    @State private var profileImage : Image? // SwiftUI
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        
        VStack{
        
        AuthHeaderView(title1: "Setup account",
                       title2: "Add a profile photo")
        
        Spacer()
        Button {
            showImagePicker = true
        } label: {
          
            if let profileImage = profileImage {
                profileImage
                    .resizable()
                    .modifier(ProfileImageModifier())

            } else {
                
                Image(systemName: "person.fill")
                    .resizable()
                    .modifier(ProfileImageModifier())
            }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
            ImagePicker(selectedImage: $selectedImage)
        }

            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

            }
        
            Spacer()
    }
        .ignoresSafeArea()
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)

    }
}
// 커스텀 모디파이어 .. 오우
private struct ProfileImageModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .padding(.top,44)
            .clipShape(Circle())
            
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
