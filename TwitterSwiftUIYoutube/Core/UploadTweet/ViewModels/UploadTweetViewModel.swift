//
//  UploadTweetViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/24.
//

import Foundation

class UploadTweetViewModel : ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption : String){
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else{
                //
            }
        }
    
    }
}
