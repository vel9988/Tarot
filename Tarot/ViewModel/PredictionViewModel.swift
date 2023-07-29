//
//  PredictionViewModel.swift
//  Tarot
//
//  Created by Dmitryi Velko on 15.07.2023.
//

import Foundation
import RealmSwift

final class PredictionViewModel: ObservableObject {
    
    @Published var name: String
    @Published var cards: [String]
    @Published var predictionText: String
    @Published var dateCreation: String = "The time is not defined"
    
    init(name: String, cards: [String], predictionText: String) {
        self.name = name
        self.cards = cards
        self.predictionText = predictionText
        dateCreation = formatDate()
    }
    
    private func formatDate() -> String {
        let date: Date = .now
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func savePrediction() {
        RealmManager.shared.savePrediction(name: name, cards: cards, predictionText: predictionText, dateCreation: dateCreation)
        
    }
    
}
