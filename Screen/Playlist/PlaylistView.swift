//
//  PlaylistView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct PlaylistView: View {

    @Environment(MusicPlayerOO.self) private var player:MusicPlayerOO
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    AsyncImage(url: URL(string: "https://picsum.photos/100")){image in
                        //โหลดรูปได้
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                    }placeholder: {
                        //ระหว่างรอโหลดรูป
                        Color.gray
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(16)
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    Text("Bauklötze")
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
                        withAnimation{
                            player.isPlayerPresented = true}
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
                        TrackRowView()
                    }
                }
                
            }//end VStack
            .padding(.horizontal)
        }
        .background(.black)
//        .fullScreenCover(isPresented: $isPlayerViewPresented) {
//            PlayerView(isPresented: $isPlayerViewPresented) //Binding ต้องมี $ ข้างหน้า Bool เสมอ
//        }
    }
}

#Preview {
    PreviewWrapper{
        PlaylistView()
    }
}
