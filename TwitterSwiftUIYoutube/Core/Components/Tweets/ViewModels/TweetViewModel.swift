//
//  TweetViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/05/29.
//

import Foundation


// 모델을 뷰모델에서 초기화하고 뷰모델을 뷰에서 초기화 -> MVVM에서 자주 볼 수 있음.
class TweetRowViewModel : ObservableObject {
    @Published var tweet : Tweet
    private let service = TweetService()

    init(tweet : Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    func likeTweet() {
        service.likeTweet(tweet){
            self.tweet.didLike = true
            
        }
    }
    
    
    func unlikeTweet() {
        service.unlikeTweet(tweet){
            self.tweet.didLike = false
            
        }
    }
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
