//
//  ArtistListView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct ArtistListView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    AsyncImage(url: URL(string: "https://picsum.photos/100")){image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.clear, Color.black.opacity(1)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                                .frame(height: 500),
                                alignment: .bottom
                            )
                    } placeholder: {
                        Color.gray
                            .frame(height: 300)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(16)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    Text("Sawano Hiroyuki")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    //Description
                    Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                //Add, Download, Suffle and Play buttons
                HStack(spacing:25){
                    Button{
                        print("Add to library")
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    
                    Button{
                        print("Download")
                    } label: {
                        Image(systemName: "arrow.down.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    
                    Button{
                        print("ellipsis")
                    }label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button{
                        print("Shuffle")
                    } label: {
                        Image(systemName: "shuffle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    
                    Button{
                        print("Play")
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.teal)
                    }
                }
                
                //Track list
                LazyVStack{
                    ForEach(1...10,id:\.self){ index in
                        ArtistTrackRow()
                    }
                }
                
            }//end VStack
            .padding(.horizontal)
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
    }
}

#Preview {
    ArtistListView()
}
