//
//  ImageUploader.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/22.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    // 서버에 이미지 업로드하기
    
    static func uploadImage(image : UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("에러가 발생하였다\(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
