//
//  PredictionView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 11.07.2023.
//

import SwiftUI

struct PredictionView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: PredictionViewModel
    
    @State var isMiniCardsIncluded: Bool = true
    @State var isSaved: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    if isMiniCardsIncluded {
                        HStack {
                            ForEach(viewModel.cards, id: \.self) { card in
                                CardView(cardName: card)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .frame(height: 300)
                    } else {
                        HStack {
                            ForEach(viewModel.cards, id: \.self) { card in
                                GeometryReader { _ in
                                    CardView(cardName: card)
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
                        .shadow(color: Color(.white), radius: 10, x: 0, y: 0)
                }
                .opacity(isMiniCardsIncluded ? 1 : 0)
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(RApp.Icons.back)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.savePrediction()
                        isSaved = true
                    } label: {
                        Image(RApp.Icons.save)
                    }
                    .disabled(isSaved)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isMiniCardsIncluded.toggle()
                    } label: {
                        Image(isMiniCardsIncluded ? RApp.Icons.zoomIn : RApp.Icons.zoomOut)
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .background(Image("Background").resizable().scaledToFill().ignoresSafeArea(.all))
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionView(viewModel: PredictionViewModel(name: "Test Name", cards: ["Judgment", "The Fool", "Eight of Swords", "Ten of Swords"], predictionText: "Test"), isSaved: false)
    }
}
