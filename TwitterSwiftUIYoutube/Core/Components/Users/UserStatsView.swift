//
//  UserStatsView.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/30.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){

            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
    
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
    
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
