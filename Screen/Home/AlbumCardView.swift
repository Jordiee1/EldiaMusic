//
//  AlbumCardView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct AlbumCardView: View {
    
    var item: Playlist
    var onTap:(() -> Void)? = nil //? เป็นการบอกว่า type นี้เป็น optional
    
    var body: some View {
        VStack(alignment:.leading,spacing: 4){
            AsyncImage(url: item.images[0].url){image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .background(.gray)
            } placeholder: {
                Color.gray
                    .frame(width: 150, height: 150)
            }
            
            Text(item.name)
                .font(.headline)
                .bold()
                .frame(maxWidth:150,alignment:.leading)//เพื่อไม่ให้ชื่อล้นออกจากรูป
                .lineLimit(1)//ไม่ให้ชื่อยาวเกิน
                
            
            Text(item.owner.display_name)
                .font(.subheadline)
                .frame(width: 150,alignment: .leading)
                .lineLimit(1)
        }
        .padding(.bottom,4)
        .onTapGesture {
            print("Tapped")
            onTap?() //callback
        }
    }
}

#Preview {
    AlbumCardView(item: Playlist(id:"1",
                                 images:[SPTImage(url: URL(string: "https://picsum.photos/200"))],
                                 name:"Album Name",
                                 owner: Owner(id:"1",display_name: "Owner")
                                 ))
}
