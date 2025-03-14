//
//  ArtistCardView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct ArtistCardView: View {
    
    var onTap:(() -> Void)? = nil
    
    var body: some View {
        VStack(alignment:.leading,spacing: 4){
            AsyncImage(url: URL(string: "https://picsum.photos/100")){image in
                //โหลดรูปได้
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            }placeholder: {
                //ระหว่างรอโหลดรูป
                Color.gray
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            Text("Sawano Hiroyuki")
                .font(.headline)
                .bold()
                .frame(maxWidth:100,alignment:.leading)
                .lineLimit(1)//ไม่ให้ชื่อยาวเกิน
        }
        .padding(.bottom,4)
        .onTapGesture {
            print("Tapped Artists")
            onTap?()
        }//end body
    }
}

#Preview {
    ArtistCardView()
}
