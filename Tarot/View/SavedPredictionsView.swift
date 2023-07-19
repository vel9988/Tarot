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
                List(cards, id: \.self) { card in
                    NavigationLink {
                        PredictionView()
                    } label: {
                        PredictionCell(shortDescriptionText: card, descriptionDate: "18/07/23")
                    }
                    
                }
            }
            .background(Image("Background"))
            
        }
        
    }
    
}

struct SavedPredictionsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPredictionsView()
    }
}
