//
//  EldiaMusicApp.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

@main
struct EldiaMusicApp: App {
    @State var player = MusicPlayerOO()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(player)
        }
    }
}

struct PreviewWrapper<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content:() -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .environment(MusicPlayerOO())
    }
}
