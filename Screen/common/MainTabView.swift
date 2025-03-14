//
//  MainTabView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 9/3/2568 BE.
//

import SwiftUI

struct MainTabView: View {
    
    
    @Environment(MusicPlayerOO.self) private var player:MusicPlayerOO
    
    init () {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .lightGray
    }
    
    var body: some View {
        ZStack{
            TabView{
                HomeView()
                    .tabItem{ //Lable คือไอคอนอยู่ข้างบน ข้อความอยู่ข้างล่าง
                        Label("Home", systemImage: "house")
                    }
                
                Text("Search")
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                Text("Library")
                    .tabItem{
                        Label("Library", systemImage: "square.stack")
                    }
            }
            .tint(.white)
            
            if player.isPlayerPresented {
                PlayerView()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
            
        }
    }
}

#Preview {
    PreviewWrapper{
        MainTabView()
    }
}
