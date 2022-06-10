//
//  AuthViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/19.
//

import SwiftUI
import Firebase

class AuthViewModel : ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser : User?
    
    private let service = UserService()
    private var tempUserSession : FirebaseAuth.User?
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            print("DEBUG: User is \(self.userSession)")
            
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        // 클라이언트에서 로그아웃
        userSession = nil
        // 백엔드에서 로그아웃.
        try? Auth.auth().signOut()
    }
    
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession // 이건 왜하는거지.
                }
        }
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else { return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
}
