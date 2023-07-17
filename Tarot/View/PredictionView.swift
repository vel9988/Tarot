//
//  PredictionView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 11.07.2023.
//

import SwiftUI

struct PredictionView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = PredictionViewModel()
    
    @State var cards: [String] = ["testCard", "testCard1", "testCard2", "testCard3", "testCard"]
    @State var isMiniCardsIncluded: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack() {
                ScrollView(.horizontal, showsIndicators: false) {
                    if isMiniCardsIncluded {
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
                                    //                                        .padding(30)
                                    //                                        .scaleEffect(geometry.frame(in: .global).midX / 1000 + 1)
                                }
                                .frame(width: 300, height: 500)
                                .frame(height: 660)
                                
                            }
                        }
                    }
                }
                
                ScrollView(showsIndicators: true) {
                    VStack {
                        Text(viewModel.predictionText)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .foregroundColor(.black)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color(.systemYellow), radius: 10, x: 0, y: 0)
                }
                .opacity(isMiniCardsIncluded ? 1 : 0)
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward.square.fill")
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isMiniCardsIncluded.toggle()
                    } label: {
                        Image(isMiniCardsIncluded ? "bigCards" : "miniCards")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 50)
                    }
                }
            }
            .background(Image("Background"))
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

//    .navigationBarBackButtonHidden(true)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView()
    }
}
