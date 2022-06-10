//
//  ProfileView.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/28.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter : TweetFilterViewModel = .tweets
    @ObservedObject var viewModel : ProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation // 서로 다른 뷰인데 셀로 묶여있다는 거 알려주기 위해
    
    init(user : User){
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        
        VStack(alignment: .leading){
        headerView
        actionButtons
        userInfoDetails
        tweetFilterBar
        tweetsView
           
        Spacer()

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "batman", fullname: "Bruce Waume", profileImageUrl: "", email: "batman@gmail.com"))
    }
}

extension ProfileView {
    
    var headerView : some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:0,y:-20)
                }

                
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
            
        }.frame(height: 96)
    }
    
    var actionButtons : some View {
        HStack(spacing: 12){
            
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
            .overlay(Circle().stroke(Color.gray , lineWidth: 0.75))
            
            Button {
                //
            } label: {
                Text(viewModel.actionButtonTitle)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }

        }.padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("It is time to start right now")
            
            
            HStack(spacing: 24){

                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Seoul, Korea")
                }
                HStack{
                    Image(systemName: "link")
                    
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
         UserStatsView()
            .padding(.vertical)
            
        }.padding(.horizontal)
    }
    
    var tweetFilterBar : some View {
        HStack {
           ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
               VStack {
                   Text(item.title)
                       .font(.subheadline)
                       .fontWeight(selectedFilter == item ? .semibold : .regular)
                       .foregroundColor(selectedFilter == item ? .black : .gray)
               
                   if selectedFilter == item {
                       Capsule()
                           .foregroundColor(Color(.systemBlue))
                           .frame(height : 3)
                           .matchedGeometryEffect(id: "filter", in: animation)
                   } else {
                       Capsule()
                           .foregroundColor(Color(.clear))
                           .frame(height : 3)
                   }
               }
               .onTapGesture {
                   withAnimation(.easeInOut){
                       self.selectedFilter = item
                   }
               }
               
           }
       }.overlay(Divider().offset(x: 0, y: 16 ))
       
    }
    
    var tweetsView : some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets(forFilter: self.selectedFilter) ){ tweet in
             
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
