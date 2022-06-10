//
//  MainTabView.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/28.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .tabItem {
                        Image(systemName: "house")
                }
                .tag(0)
            ExploreView()
                .tabItem {
                        Image(systemName: "magnifyingglass")
                }
                .tag(1)
            NotificationsView()
                .tabItem {
                        Image(systemName: "bell")
                }
                .tag(2)
            MessagesView()
                .tabItem {
                        Image(systemName: "envelope")
                }
                .tag(3)
        }
//        .onChange(of: selectedIndex) { newValue in
//            print(newValue)
//        }

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
