//
//  UserProfile.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct UserProfile: View {
    
    var onUserProfileTap:(() -> Void)? = nil
    
    struct ProfileStatView: View {
        var title: String
        var count: String
        
        var body: some View {
            VStack {
                Text(count)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct PlaylistRowView: View {
        var title: String
        var songCount: String
        var onTap: (() -> Void)? 
        
        var body: some View {
            Button(action: {
                print("\(title) tapped")
                onTap?()
            }) {
                HStack {
                    Image(systemName: "music.note.list")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(songCount)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
            }
        }
    }

    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    AsyncImage(url: URL(string: "https://picsum.photos/200")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 120, height: 120)
                    }

                    Text("Erwin Smith")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Button(action: {
                        print("Edit Profile")
                    }) {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Capsule())
                    }
                    .padding(.top, 5)
                }
                .padding(.top, 50)

                HStack {
                    ProfileStatView(title: "Liked Songs", count: "120")
                    ProfileStatView(title: "Albums", count: "30")
                    ProfileStatView(title: "Artists", count: "15")
                }
                .padding(.top, 20)

                
                VStack(alignment: .leading) {
                    Text("Your Playlists")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .padding(.leading)

                    LazyVStack {
                        ForEach(1...5, id: \.self) { index in
                            PlaylistRowView(title: "Playlist \(index)", songCount: "\(index * 10) songs", onTap: {
                                print("Playlist \(index) tapped")
                                onUserProfileTap?()
                            })
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.teal, location: 0.0),
                    .init(color: Color.black, location: 0.6)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    UserProfile()
}
