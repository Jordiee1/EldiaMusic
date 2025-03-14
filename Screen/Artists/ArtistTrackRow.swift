//
//  ArtistTrackRow.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct ArtistTrackRow: View {
    let url = URL(string: "https://picsum.photos/100")
    
    var body: some View {
        HStack(spacing:16){
            //Track number
            Text("01")
                .font(.headline)
                .padding(.horizontal,4)
                .foregroundColor(.white)
            
            //cover image
            AsyncImage(url: url) { image in
                //โหลดรูปได้
                image
                    .resizable()
            }placeholder: {
                //ระหว่่างรอโหลด
                Color.gray
            }
            .frame(width: 60, height: 60)
            
            //Track title and artist name
            VStack(alignment: .leading){
                Text("K21")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                Text("Sawano Hiroyuki")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            //Options button
            Button{
                
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
        }
        .background(Color.white.opacity(0.1))
    }
}

#Preview {
    ArtistTrackRow()
}
