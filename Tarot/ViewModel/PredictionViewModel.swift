//
//  PredictionViewModel.swift
//  Tarot
//
//  Created by Dmitryi Velko on 15.07.2023.
//

import Foundation

final class PredictionViewModel: ObservableObject {
    
    @Published var cards: [String]
    @Published var predictionText: String
    
    init(cards: [String], predictionText: String) {
        self.cards = cards
        self.predictionText = predictionText
    }
    
}
