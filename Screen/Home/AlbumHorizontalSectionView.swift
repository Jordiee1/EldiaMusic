//
//  AlbumHorizontalSectionView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct AlbumHorizontalSectionView: View {
    
    var items: [Playlist] = []
    var onAlbumTap:(() -> Void)? = nil
    
    var body: some View {
        VStack(alignment:.leading, spacing: 8){
            //Section title
            Text("Recently Played")
                .font(.title)
                .bold()
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(items, id: \.id) { item in
                        AlbumCardView(item: item) {
                            onAlbumTap?()
                        }
                    }
//                    ForEach(0..<5){_ in
//                        AlbumCardView{
//                            print("Print tapped in AlbumHorizontalSectionView")
//                            onAlbumTap?()
//                        }
                }
            }
        }
    }
}

#Preview {
    AlbumHorizontalSectionView()
}
