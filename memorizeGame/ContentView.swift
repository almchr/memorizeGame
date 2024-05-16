//
//  ContentView.swift
//  memorizeGame
//
//  Created by memris on 16.05.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐶","🌸","🐉","☘️","🐠","🦄"]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(),GridItem()],
                      alignment: .leading,
                      spacing: 10 ){
                ForEach(0..<6,id: \.self){index in
                    CardView(content: emojis[index])}
            }.padding()
        }
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 15)
            Group{
                base.strokeBorder(lineWidth: 3)
                HStack {
                    Text(content).font(.largeTitle)
                        .padding(50)
                }
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        .foregroundColor(.purple)
    }}

#Preview {
    ContentView()
}
