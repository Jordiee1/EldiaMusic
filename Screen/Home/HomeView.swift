//
//  HomeView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresented: Bool = false
    @State private var isPresentedArtist: Bool = false
    @State private var isPresentedUserProfile: Bool = false
    
    @State private var playlists: [Playlist] = []
    
    var profileHeaderView: some View{
        HStack{
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40,height: 40)
                .background(.gray)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text("Hi, Erwin Smith")
                    .font(.subheadline)
                Text("Welcome Back!")
                    .font(.headline)
                    .bold()
            }
            
            Spacer()
            
            Button{
                
            }label: {
                Image(systemName: "bell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.teal)
            }
        }//end HStack
        .onTapGesture {
                    print("Tapped UserProfile")
                    isPresentedUserProfile = true
    }
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 8){
                //Header Profile
                profileHeaderView
                    .foregroundStyle(.white)
                    .padding()
                
                //Album sections
                ScrollView(.vertical){
                    ArtistHorizontalSection(){
                        isPresentedArtist = true
                    }
                    AlbumHorizontalSectionView(items: playlists){
                        isPresented = true
                    }
                    AlbumHorizontalSectionView()
                }
                .foregroundStyle(.white)
            }
            .background(.black)
            .navigationDestination(isPresented: $isPresented){
                PlaylistView()
            }
            .navigationDestination(isPresented: $isPresentedArtist){
                ArtistListView()
            }
            .navigationDestination(isPresented: $isPresentedUserProfile) {
                UserProfile()
            }
            .onAppear(){
                Task{
                    do{
                        let response = try await SpotifyAPI.shared.getChillPlaylists()
                        self.playlists = response.playlists.items
                    } catch {
                        print(error)
                    }
                }
            }
            
        }
    }
}

#Preview {
    PreviewWrapper{
        HomeView()
    }
}
