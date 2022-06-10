//
//  TwitterSwiftUIYoutubeApp.swift
//  TwitterSwiftUIYoutube
//
//  Created by DaeSeong on 2022/03/28.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIYoutubeApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()   
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)

            
        }
    }
}
