//
//  PlayerView.swift
//  EldiaMusic
//
//  Created by iapp21-b on 1/3/2568 BE.
//

import SwiftUI

struct PlayerView: View {
    @Environment(MusicPlayerOO.self) private var player:MusicPlayerOO
    
    @State private var rotation: Double = 0.0
    @State private var offsetY: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing:40) {
            HStack{
                Button{
                    print("Close Player")
                    withAnimation{
                        player.isPlayerPresented = false
                    }
                }label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Text("Now Playing")
                    .font(.headline)
                
                Spacer()
                
                Button{
                    
                }label: {
                    Image(systemName: "ellipsis")
                        .resizable()//ใส่เพื่อบอกมันว่ารูปในสามารถขยายได้
                        .scaledToFit()//สั่งให้สเกลตรงตามต้องการ
                        .frame(width: 20, height: 20)
                }
            }//end HStack
            
            
            AsyncImage(url: URL(string: "https://picsum.photos/200")) { image in
                image
                .resizable()
            }placeholder: {
                Color.gray
            }
                .scaledToFit()
                .frame(width: 300, height: 300)
                .background(.gray)
                .clipShape(Circle())
                .overlay{
                    Circle()
                        .stroke(.black,lineWidth: 4)
                }
                .shadow(radius: 10)
                .rotationEffect(.degrees(rotation),anchor: .center)
                .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: rotation)
                .onAppear{
                    rotation = 360
                }
            
            //Music Title & artist name
            VStack{
                Text("K21")
                    .font(.title)
                Text("Sawano Hiroyuki")
                    .font(.title2)
            }//end VStack
            
            //linear progress bar
            VStack{
                ProgressView()
                    .progressViewStyle(LinearProgressViewStyle())
                HStack{
                    Text("0:00")
                        .font(.caption)
                    Spacer()
                    Text("3:22")
                        .font(.caption)
                }//end HStack
            }//end VStack
            
            //Player Control
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "repeat")
                        .font(.title2) //สามารถแปลงเป็นฟ้อนและกำหนดขนาดแบบนี้ได้ ซึ่งเร็วกว่าแต่จะไม่ยืดหยุ่นเท่าปรับเอง
                }
                
                
                HStack{ //HStack2
                    Spacer()
                    //previous button
                    Button{
                        
                    }label: {
                        Image(systemName: "backward.fill")
                            .font(.title2)
                    }
                    
                    //Play and Stop Button
                    Button{
                        
                    }label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.teal)
                    }
                    
                    //Next Button
                    Button{
                        
                    }label: {
                        Image(systemName: "forward.fill")
                            .font(.title2)
                    }
                    
                    Spacer()
                    
                    //Favorit button
                    Button{
                        
                    }label: {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                }//end HStack2
            }//end HStack
            Spacer()
        }//end VStack
        .padding()
        .background(.black)
        .foregroundStyle(.white)
        .offset(y: offsetY)
        .gesture(
            DragGesture()
                .onChanged { value in //ตอนกำลังเปลี่ยนแปลง
                    if value.translation.height > 0 {
                        offsetY = value.translation.height
                    }
                }
                .onEnded { value in //ตอนที่เราปล่อย
                    if value.translation.height > 200 {
                        //Collapse player view
                        withAnimation {
                            player.isPlayerPresented = false
                        }
                    }else {
                        offsetY = 0
                    }
                }
        )
    }//body
}

#Preview {
    PreviewWrapper{
        PlayerView()
    }
}
