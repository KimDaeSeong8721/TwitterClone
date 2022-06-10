//
//  UserService.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    // 서버에서 데이터 가져오기
    func fetchUser(withUid uid : String, completion: @escaping (User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)

            }
    }
    
    func fetchUsers(completion: @escaping(([User]) -> Void)){
        
//        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let users = documents.compactMap { try? $0.data(as: User.self)} // 한줄로 써보리기.
                
//                documents.forEach { document in
//                    guard let user = try? document.data(as: User.self) else {return}
//                    users.append(user)
//                }
                
                completion(users)
            }
    }
}
