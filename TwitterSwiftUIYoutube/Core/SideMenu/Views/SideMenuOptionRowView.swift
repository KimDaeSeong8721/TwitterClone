//
//  SideMenuOptionRowView.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/31.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel : SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black )
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height : 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
