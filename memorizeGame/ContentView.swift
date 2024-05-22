//
//  ContentView.swift
//  memorizeGame
//
//  Created by memris on 16.05.2024.
//

import SwiftUI

struct ContentView: View {
    let cards: [String] = ["🐶","🌸","🐉","☘️","🐠","🦄"]
    @State var cardsCount : Int = 4
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(),GridItem()],
                      alignment: .leading,
                      spacing: 10 ){
                ForEach(0..<cardsCount,id: \.self){index in
                    CardView(content: cards[index])}
            }.padding()
        }
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }.padding()
    }
    var cardRemover: some View {
        Button(action: {
           if cardsCount>1 {
               cardsCount -= 1
           }
        }, label: {
            Image(systemName: "folder.badge.minus").imageScale(.large).font(.largeTitle)
        })
    }
    var cardAdder: some View {
        Button(action: {
            if cardsCount<cards.count {
               cardsCount += 1
           }
        }, label: {
            Image(systemName: "folder.badge.plus").imageScale(.large).font(.largeTitle)
        })
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
