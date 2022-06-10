//
//  TweetRowView.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/28.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel : TweetRowViewModel
    
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    var body: some View {

        VStack(alignment: .leading){

            if let user = viewModel.tweet.user {
            HStack(alignment: .top, spacing: 12){
               
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                
                // userInfo & tweet caption
                VStack(alignment: .leading , spacing: 4){
                    //userInfo
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username)")
                                .foregroundColor(Color(.gray))
                                .font(.caption)
                            Text("49w")
                                .foregroundColor(Color(.gray))
                                .font(.caption)
                        }
                    
                    
                    //tweet caption
                    Text(viewModel.tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
        }
            
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }

                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }

                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlikeTweet() :
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }

                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

                
                

            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
        
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
