//
//  ContentView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var cards: [String] = ["testCard", "testCard1", "testCard2", "testCard3", "testCard"]
    @State var miniCardsState: Bool = true
    
    var body: some View {
        VStack() {
            ScrollView(.horizontal, showsIndicators: false) {
                if miniCardsState {
                    HStack {
                        ForEach(cards, id: \.self) { card in
                            CardView(cardName: card)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .frame(height: 300)
                } else {
                    HStack {
                        ForEach(cards, id: \.self) { card in
                            GeometryReader { geometry in
                                CardView(cardName: card)
//                                    .scaleEffect(geometry.frame(in: .global).midX / 1000 + 1)
                            }
                            .frame(width: 300, height: 500)
                            .frame(height: 650)

                        }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    miniCardsState.toggle()
                } label: {
                    Image(miniCardsState ? "bigCards" : "miniCards")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 50)
                }
                .padding()
                
            }
        }
        .background(Image("Background"))
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
