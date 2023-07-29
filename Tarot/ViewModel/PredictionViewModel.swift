//
//  PredictionViewModel.swift
//  Tarot
//
//  Created by Dmitryi Velko on 15.07.2023.
//

import Foundation
import RealmSwift

final class PredictionViewModel: ObservableObject {
    
    @Published var name: String = "Name Test"
    @Published var cards: [String]
    @Published var predictionText: String
    @Published var dateCreation: String = "Date Test"
    
    init(cards: [String], predictionText: String) {
        self.cards = cards
        self.predictionText = predictionText
    }
    
    func savePrediction() {
        RealmManager.shared.savePrediction(name: name, cards: cards, predictionText: predictionText, dateCreation: dateCreation)
        
    }
    
}
