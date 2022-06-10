//
//  TweetFilterViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/29.
//

import Foundation


enum TweetFilterViewModel : Int, CaseIterable {
    case tweets
    case replies
    case likes

    var title: String {
        switch self {
        case .tweets : return "Tweets"
        case .replies : return "Replies"
        case .likes : return "Likes"
        }
    }
}

