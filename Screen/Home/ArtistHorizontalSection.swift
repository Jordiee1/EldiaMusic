//
//  ArtistHorizontalSection.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct ArtistHorizontalSection: View {
    
    var onArtistTap:(() -> Void)? = nil
    
    var body: some View {
        VStack(alignment:.leading){
            //Section title
            Text("Follwed Artists")
                .font(.title)
                .bold()
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5){_ in
                        ArtistCardView{
                            print("Artist")
                            onArtistTap?()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ArtistHorizontalSection()
}
