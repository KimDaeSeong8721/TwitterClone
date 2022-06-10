//
//  User.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
//decodable protoco을 firebase을 통해 할때 필요함.


struct User : Identifiable , Decodable{
    @DocumentID var id : String?  //firebase의 다큐먼트id와 연결.
    let username : String
    let fullname : String
    let profileImageUrl : String
    let email : String
    
    var isCurrentUser : Bool { return Auth.auth().currentUser?.uid == id}
}
