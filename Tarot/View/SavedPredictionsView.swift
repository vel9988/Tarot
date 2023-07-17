//
//  SavedPredictionsView.swift
//  Tarot
//
//  Created by Dmitryi Velko on 17.07.2023.
//

import SwiftUI

struct SavedPredictionsView: View {
    
    @State var cards: [String] = ["testCard", "testCard1", "testCard2", "testCard3"]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(cards, id: \.self) { card in
                        NavigationLink(destination: PredictionView()) {
                            HStack {
                                VStack() {
                                    Text("Question title")
                                        .font(Font.title2.bold())
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                    
                                    Text("Prediction 11/02/23")
                                        .foregroundColor(.white)
//                                        .frame(maxWidth: .infinity, maxHeight: 70)
                                        .padding(.horizontal)
                                    
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .padding()
                                
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                            }
                        }
                    }
                }
                //                List(cards, id: \.self) { card in
                //                    NavigationLink(destination: PredictionView()) {
                //                        Text(card)
                //                            .padding()
                //                    }
                //
                //                }
            }.background(Image("Background"))
            
        }
        
    }
    
}

struct SavedPredictionsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPredictionsView()
    }
}
