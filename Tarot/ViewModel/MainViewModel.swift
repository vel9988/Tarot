//
//  MainViewModel.swift
//  Tarot
//
//  Created by Dmitryi Velko on 23.07.2023.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    private let apiCaller = APICaller()

    func createPrediction(cards: [String], predictionText: String) -> Prediction {
        let prediction = Prediction()
        prediction.cards.append(objectsIn: cards)
        prediction.predictionText = predictionText
        return prediction
    }
    
    func randomCards() -> [String] {
        let cards = Cards()
        return Array(cards.tarotCardNames.shuffled().prefix(5))
    }
    
}
